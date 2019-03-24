import argparse
import os


HOME = os.environ['HOME']
CWD = os.getcwd()
IGNORE = (
    '.git',
    '.gitignore',
    '.mypy_cache',
    'st.config.h',
    'linkdots.py',
    'update',
)


parser = argparse.ArgumentParser()
parser.add_argument('mode', choices=['link', 'unlink', 'dryrun'])


def iterdir(src, dest, fn, ignore=()):
    fnames = set(os.listdir(src)).difference(ignore)
    for fname in fnames:
        fn(os.path.join(src, fname), os.path.join(dest, fname))


def unlink(src, dest):
    if not os.path.lexists(dest):
        return
    elif os.path.realpath(dest) == src:
        print("removing %s" % dest)
        os.unlink(dest)
    elif os.path.isdir(src):
        iterdir(src, dest, unlink)
        if not len(os.listdir(dest)):
            os.rmdir(dest)


def mklink(src, dest):
    if os.path.realpath(dest) == src:
        return
    elif os.path.isdir(src):
        if not os.path.lexists(dest):
            os.mkdir(dest)
        iterdir(src, dest, mklink)
        return
    elif os.path.lexists(dest):
        os.unlink(dest)

    print("creating link to %s" % dest)
    os.symlink(src, dest)


def dryrun(src, dest):
    if os.path.realpath(dest) == src:
        print("%s already linked to %s" % (os.path.basename(src), dest))
        return
    elif os.path.isdir(src):
        print("Would make dir %s" % dest)
        iterdir(src, dest, dryrun)
        return
    elif os.path.lexists(dest):
        print("Would rm %s" % dest)

    print("would symlink %s to %s" % (src, dest))


if __name__ == '__main__':
    fn_map = {
        'link': mklink,
        'unlink': unlink,
        'dryrun': dryrun,
    }
    opts = parser.parse_args()
    fn = fn_map.get(opts.mode)
    iterdir(CWD, HOME, fn, IGNORE)
