class chocolatey::packages {

    package { 'notepadplusplus':
        ensure   => latest,
        provider => 'chocolatey',
    }

    package { 'googlechrome':
        ensure   => latest,
        provider => 'chocolatey',
    }
}