name 'expensify'
maintainer 'Justin Dugger'
maintainer_email 'jldugger@gmail.com'
license 'GPL-2.0'
description 'Installs/Configures expensify'
long_description 'Installs/Configures expensify'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
supports 'ubuntu'

issues_url 'https://github.com/jldugger/expensify-cookbook/issues'
source_url 'https://github.com/jldugger/expensify-cookbook'

depends 'sudo'
