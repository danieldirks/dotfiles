# US layout
Set-WinUserLanguageList -Force "en-US"

# US International layout
#$1 = Get-WinUserLanguageList
#$1.RemoveAll( { $args[0].LanguageTag -clike '*' } )
#$1.Add("en-US")
#$1[0].InputMethodTips.Clear()
#$1[0].InputMethodTips.Add('0409:00020409')
#Set-WinUserLanguageList -LanguageList $1 -Force

Set-Culture "de-DE"

# https://learn.microsoft.com/en-us/windows/win32/intl/table-of-geographical-locations
Set-WinHomeLocation -GeoId "0x5e"
