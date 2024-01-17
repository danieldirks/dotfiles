$bin = "$env:USERPROFILE\bin"
$path = [Environment]::GetEnvironmentVariable('PATH', 'User').Split(';')
if (!$path.Contains($bin)) {
    $path = [String]::Join(';', $path + $bin)
    [Environment]::SetEnvironmentVariable('PATH', $path, 'User')
}
