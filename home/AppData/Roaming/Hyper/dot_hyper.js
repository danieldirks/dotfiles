module.exports = {
    config: {
        bell: false,
        catppuccinTheme: 'Macchiato',
        defaultSSHApp: true,
        fontSize: 16,
        fontFamily: "Cascadia Code, Menlo, monospace",
        //shell: 'wsl.exe',
        //shellArgs: ['--cd', '~'],

        defaultProfile: "Ubuntu (WSL)",
        profiles: [
            {
                name: "Ubuntu (WSL)",
                config: {
                    shell: "wsl.exe",
                    shellArgs: ["--cd", "~"],
                },
            },
            {
                name: "PowerShell",
                config: {
                    shell: "powershell.exe",
                },
            },
            {
                name: "PowerShell (Admin)",
                config: {
                    shell: "powershell.exe",
                    shellArgs: ["Start-Process", "powershell", "-Verb", "runAs"],
                },
            },
        ],
    },
    plugins: ["hypurr#latest"],
};
