const vscode = require('vscode');

function activate(context) {
  const cmd = vscode.commands.registerCommand('open-all-references.openAll', async () => {
    const editor = vscode.window.activeTextEditor;
    if (!editor) return;

    const { document, selection } = editor;

    const locations = await vscode.commands.executeCommand(
      'vscode.executeReferenceProvider',
      document.uri,
      selection.active
    );

    if (!locations || locations.length === 0) {
      vscode.window.showInformationMessage('No references found.');
      return;
    }

    for (const location of locations) {
      await vscode.window.showTextDocument(location.uri, {
        preview: false,
        preserveFocus: true,
        selection: location.range,
      });
    }
  });

  context.subscriptions.push(cmd);
}

function deactivate() {}

module.exports = { activate, deactivate };
