module.exports = {
    config: {
        fontSize: 16,
        fontFamily: 'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
        {{- if eq .osid "windows" }}
        shell: 'wsl.exe',
        shellArgs: ['--cd', '~'],
        {{- end }}
        bell: false,
        defaultSSHApp: true,
    },
    plugins: ["nord-hyper"],
};
