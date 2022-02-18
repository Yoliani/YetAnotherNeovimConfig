lua << EOF
package.loaded['mytheme'] = nil
package.loaded['mytheme.util'] = nil
package.loaded['mytheme.colors'] = nil
package.loaded['mytheme.theme'] = nil
package.loaded['mytheme.functions'] = nil

require('mytheme.util').load()
EOF
