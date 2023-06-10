module.exports = {
    config: {
        bell: false,
        defaultSSHApp: true,
        fontSize: 16,
        fontFamily: 'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
        //shell: 'wsl.exe',
        //shellArgs: ['--cd', '~'],

        // hyper-lanuch-menu
        shells: [
            {name: "WSL", shell: "wsl.exe", args: ['--cd', '~'], shortcut: "L", default: true},
            {name: "PowerShell", shell: "powershell.exe", shortcut: "P"},
            {name: "PowerShell (Admin)", shell: "powershell.exe", args: ['Start-Process', 'powershell', '-Verb', 'runAs'], shortcut: "O"},
        ],
        showShellNotifications: false,
        openOnSelect: true,
        setOnSelect: false,
        selectShellKeymap: "ctrl+alt",
    },
    plugins: ["nord-hyper", "hyper-launch-menu"],
};
