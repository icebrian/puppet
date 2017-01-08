class windows::chocolatey {

  exec { 'install_chocolatey':
    command  => "set-executionpolicy unrestricted -force -scope process; (iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')))>\$null 2>&1",
    provider => 'powershell',
    creates  => 'C:/ProgramData/chocolatey',
  }

}