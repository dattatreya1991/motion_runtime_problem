class AppDelegate
  UINT64_MAX = 1000000
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow

    imap_server   = "server"
    imap_port     = 993
    imap_ssl      = true
    imap_user     = 'user'
    imap_password = 'password'


    session = MCOIMAPSession.alloc.init
    session.hostname = imap_server
    session.port     = imap_port
    session.username = imap_user
    session.password = imap_password
    session.connectionType = MCOConnectionTypeTLS if imap_ssl

    requestKind = MCOIMAPMessagesRequestKindHeaders
    folder = "INBOX"
    # uids = [MCOIndexSet indexSetWithRange:MCORangeMake(1, UINT64_MAX)]
    mcor = MCORangeMake(1, UINT64_MAX)
    p mcor
    uids = MCOIndexSet.indexSetWithRange(mcor)

  end

  def buildWindow
    @mainWindow = NSWindow.alloc.initWithContentRect([[240, 180], [480, 360]],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
    @mainWindow.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    @mainWindow.orderFrontRegardless
  end
end
