import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(WhatsApp());
}

class Utils {
  static final RegExp regexpEmoji =
      RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');
  static final RegExp regexAlphaNum = RegExp(r'[a-zA-Z0-9]');

  static const Color appBarMobile = Color(0xFF006359);
  static const Color appBarLaptop = Color(0xFFEDEDED);

  static const Color appBarIconMobile = Color(0xFFFFFFFF);
  static const Color appBarIconLaptop = Color(0xFF919191);

  static const Color chatUnreadCount = Color(0xFF62D366);

  static const Color connected = Color(0xFF73D286);

  static const Color laptopBottomChatBar = Color(0xFFEFEFEF);

  static const Color sectionDivider = Color(0xFFEAEAEA);
  static const Color sectionSpacer = Color(0xFFF7F7F7);

  static const Color chatSelf = Color(0xFFE2F7CB);

  static const Color softGreen = Color(0xFF55BCA6);

  static const Color chatBackground = Color(0xFFE4DDD6);

  static Widget doubleCheck(bool read, bool small) {
    return Container(
      width: 25,
      height: small ? 12 : 14,
      child: Stack(
        children: [
          Icon(Icons.check, size: small ? 14 : 18, color: read ? Colors.blue[400] : Colors.grey[500]),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: ClipPath(
              clipper: ClipCheck(small),
              child: Icon(Icons.check, size: small ? 14 : 18, color: read ? Colors.blue[400] : Colors.grey[500]),
            ),
          ),
        ],
      ),
    );
  }

  static Widget action(IconData icon, GestureTapCallback onTap, bool isMobile, {bool smallDevice}) {
    return InkResponse(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(smallDevice ? 8 : 15),
        child: Icon(
          icon,
          color: isMobile ? Utils.appBarIconMobile : Utils.appBarIconLaptop,
          size: smallDevice ? 15 : 25,
        ),
      ),
    );
  }

  static User mariano = User(
    'Mariano Zorrilla',
    'https://pbs.twimg.com/profile_images/1222274976415281153/TVSI4DIx_400x400.jpg',
    '555-555-5555',
    'Available',
    1587688793579,
    true,
  );

  static User flutter = User(
    'Flutter Dev',
    'https://pbs.twimg.com/profile_images/971176720169660416/Rjaq-ruU_400x400.jpg',
    '444-444-4444',
    'Flutter Web is amazing!',
    1587688823261,
    true,
  );

  static User martin = User(
    'Martin Aguinis',
    'https://pbs.twimg.com/profile_images/1139005628846878721/lSg5Loq4_400x400.jpg',
    '999-999-9999',
    'Global Marketing Lead @FlutterDev',
    1587688914210,
    false,
  );

  static User nilay = User(
    'Nilay Yener',
    'https://pbs.twimg.com/profile_images/1132357550379134976/tRQLk7Je_400x400.jpg',
    '222-222-2222',
    'Dev Rel #FlutterPen',
    1587689001530,
    false,
  );

  static User codePen = User(
    'CodePen.IO',
    'https://webdesignledger.com/wp-content/uploads/2015/09/codepen-logo.jpg',
    '333-333-3333',
    'Build, test, and discover front-end code',
    1587842552935,
    true,
  );

  static User tim = User(
    'Tim Sneath',
    'https://pbs.twimg.com/profile_images/653618067084218368/XlQA-oRl.jpg',
    '111-111-1111',
    'Group Product Manager for Flutter and Dart. https://flutter.dev | https://dart.dev',
    DateTime.now().millisecondsSinceEpoch,
    false,
  );

  static User rFlutterDev = User(
    'r/FlutterDev',
    'https://pbs.twimg.com/profile_images/971176720169660416/Rjaq-ruU_400x400.jpg',
    '555-555-5555',
    'r/FlutterDev, a subreddit for Google\'s portable UI framework. Operated by @jacoplane. Discord chat server: '
        'http://discord.gg/uMya6wQ',
    DateTime.now().millisecondsSinceEpoch,
    true,
  );

  static User flutterFlakes = User(
    'FlutterFlakes',
    'https://pbs.twimg.com/profile_images/1002020474136576000/gyhuTipX_400x400.jpg',
    '888-888-8888',
    'Everything is Widget.\nfounder:@dhuma1981\nhttp://github.com/FlutterFlakes',
    DateTime.now().millisecondsSinceEpoch,
    false,
  );

  static User flutterNYC = User(
    'Flutter NYC 🦄💙',
    'https://pbs.twimg.com/profile_images/1160149586813554688/9Abnl3kw_400x400.jpg',
    '999-999-9999',
    'New York Flutter Developer Meetup #FlutterNYC',
    DateTime.now().millisecondsSinceEpoch,
    false,
  );

  static Conversation flutterChat = Conversation(flutter, 1587688793579, 1587690706518, [
    Chat(flutter, 'Wow! I can\'t believe this is working on CodePen!', 1587688792579, true),
    Chat(mariano, 'Right?! #FlutterPen power!', 1587688793579, true),
    Chat(flutter, '😎', 1587689152490, true),
    Chat(flutter, 'Truly amazing! I want more examples!', 1587690706518, false),
  ]);

  static Conversation martinChat = Conversation(martin, 1587688793050, 1587688793050, [
    Chat(martin, 'Yo! What\'s new? More stuffs?', 1587688793000, true),
    Chat(mariano, 'That\'s right! This one is really good and took me a long time.', 1587688793050, true),
  ]);

  static Conversation nilayChat = Conversation(nilay, 1587794105841, 1587794105841, [
    Chat(nilay, 'Hey! What\'s new?', 1587793596393, true),
    Chat(mariano, 'Got something really interesting for #FlutterPen', 1587793628732, true),
    Chat(mariano, '👀👀👀', 1587793719066, false),
    Chat(mariano, 'You should check on my twitter @geekmz', 1587794105841, false),
  ]);

  static Conversation codePenChat = Conversation(codePen, 1587842552935, 1587842690825, [
    Chat(codePen, 'Are you making a new examples? 💙', 1587842690825, true),
  ]);

  static User get currentUser => mariano;

  static Conversation _currentConversation;

  static Conversation get currentConversation => _currentConversation;

  static set conversation(Conversation conversation) => _currentConversation = conversation;
}

class ClipCheck extends CustomClipper<Path> {
  final small;

  ClipCheck(this.small);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(small ? 4 : 5.5, 0);
    path.lineTo(small ? 4 : 5.5, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class User {
  String name;
  String avatar;
  String phone;
  String status;
  int lastConnection;
  bool online;

  User(this.name, this.avatar, this.phone, this.status, this.lastConnection, this.online);

  @override
  String toString() {
    return 'User{name: $name, avatar: $avatar, phone: $phone, status: $status, lastConnection: $lastConnection, online: $online}';
  }
}

class Chat {
  User user;
  String text;
  int timestamp;
  bool firstSection;

  Chat(this.user, this.text, this.timestamp, this.firstSection);

  @override
  String toString() {
    return 'Chat{user: $user, text: $text, timestamp: $timestamp, firstSection: $firstSection}';
  }
}

class Conversation {
  User user;
  int lastSeen;
  int lastTimestamp;
  List<Chat> chats;

  Conversation(this.user, this.lastSeen, this.lastTimestamp, this.chats);

  @override
  String toString() {
    return 'Conversation{user: $user, chats: $chats}';
  }
}

typedef ConversationCallback = Function(Conversation conversation);
typedef RefreshCallback = Function(Conversation conversation);

class HomeBuilder extends StatefulWidget {
  final RefreshCallback refresh;
  final ConversationCallback callback;
  final Widget Function(BuildContext context, ConversationCallback callback, RefreshCallback refreshCallback)
      mobileLayout;
  final Widget Function(BuildContext context, ConversationCallback callback, RefreshCallback refreshCallback)
      tabletLayout;
  final Widget Function(BuildContext context, ConversationCallback callback, RefreshCallback refreshCallback)
      laptopLayout;

  HomeBuilder(
      {Key key,
      @required this.refresh,
      @required this.callback,
      @required this.mobileLayout,
      @required this.tabletLayout,
      @required this.laptopLayout})
      : super(key: key);

  @override
  _HomeBuilderState createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<HomeBuilder> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 720;
    final isTablet = MediaQuery.of(context).size.width < 1100;
    return isMobile
        ? widget.mobileLayout(context, widget.callback, widget.refresh)
        : isTablet
            ? widget.tabletLayout(context, widget.callback, widget.refresh)
            : widget.laptopLayout(context, widget.callback, widget.refresh);
  }
}

class WhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ChatsScreenState> _chatsMobileKey = GlobalKey();
  final GlobalKey<ChatsScreenState> _chatsLaptopKey = GlobalKey();
  final GlobalKey<ContactScreenState> _contactKey = GlobalKey();
  final GlobalKey<ChatScreenState> _chatKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return HomeBuilder(
      refresh: (conversation) {
        final now = DateTime.now().millisecondsSinceEpoch;
        setState(() {
          Utils.currentUser.lastConnection = now;
          conversation.lastSeen = now;
          conversation.lastTimestamp = now;
        });
        if (_chatsLaptopKey.currentState != null) _chatsLaptopKey.currentState.sortConversations();
        if (_chatsMobileKey.currentState != null) _chatsMobileKey.currentState.sortConversations();
      },
      callback: (conversation) {
        final now = DateTime.now().millisecondsSinceEpoch;
        setState(() {
          Utils.currentUser.lastConnection = now;
          conversation.lastSeen = now;
        });
        if (_chatKey.currentState != null) _chatKey.currentState.setConversation(conversation);
      },
      mobileLayout: (context, callback, refresh) {
        return _leftSection(context, true, callback, refresh);
      },
      tabletLayout: (context, callback, refresh) {
        return Row(children: [
          Container(
            width: 380,
            child: _leftSection(context, false, callback, refresh),
          ),
          Container(width: 1, color: Colors.grey[300]),
          Expanded(child: _rightSection(context, false, refresh))
        ]);
      },
      laptopLayout: (context, callback, refresh) {
        return Row(children: [
          Container(
            width: 380,
            child: _leftSection(context, false, callback, refresh),
          ),
          Container(width: 1, color: Colors.grey[300]),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ChatScreen(key: _chatKey, context: context, contact: _contactKey, refresh: refresh)),
                Container(width: 1, color: Colors.grey[300]),
                ContactScreen(key: _contactKey, visible: false),
              ],
            ),
          ),
        ]);
      },
    );
  }

  Widget _leftSection(BuildContext context, bool isMobile, ConversationCallback callback, RefreshCallback refresh) {
    return MaterialApp(
      title: 'WhatsApp',
      initialRoute: '/',
      routes: {
        '/': (context) => ChatsScreen(
            key: isMobile ? _chatsMobileKey : _chatsLaptopKey,
            context: context,
            isMobile: isMobile,
            callback: callback,
            refresh: refresh),
        '/chat': (context) => ChatScreen(key: _chatKey, context: context, refresh: refresh),
      },
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _rightSection(BuildContext context, bool isMobile, RefreshCallback refresh) {
    return MaterialApp(
      title: 'WhatsApp',
      initialRoute: '/chat',
      routes: {
        '/': (context) => ChatsScreen(key: null, context: context, isMobile: false, callback: null),
        '/chat': (context) => ChatScreen(key: _chatKey, context: context, refresh: refresh),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatsScreen extends StatefulWidget {
  final ConversationCallback callback;
  final RefreshCallback refresh;
  final BuildContext context;
  final bool isMobile;

  const ChatsScreen({Key key, this.callback, this.refresh, this.context, this.isMobile}) : super(key: key);

  @override
  ChatsScreenState createState() => ChatsScreenState();
}

class ChatsScreenState extends State<ChatsScreen> {
  List<Conversation> _conversations = [Utils.flutterChat, Utils.martinChat, Utils.nilayChat, Utils.codePenChat];

  List<Widget> _mobileActions = [];
  List<Widget> _laptopActions = [];

  @override
  void initState() {
    super.initState();
    _loadActions();
    sortConversations();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(size, widget.isMobile),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 5),
        itemBuilder: (context, index) {
          final item = _conversations[index];
          return ChatItem(
            conversation: item,
            isMobile: widget.isMobile,
            callback: widget.callback,
            refresh: widget.refresh,
          );
        },
        itemCount: _conversations.length,
      ),
      floatingActionButton: widget.isMobile
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(AnimatedRoute(
                  widget: ContactsScreen(isMobile: widget.isMobile),
                  anim: PageAnimation.FADE_SCALE,
                ))
                    .then((conversation) {
                  if (conversation != null) {
                    if (_userNotInChats(conversation)) {
                      setState(() => _conversations.add(conversation));
                      sortConversations();
                      jumpToConversation(conversation);
                    } else {
                      jumpToConversation(
                          _conversations.where((element) => element.user == (conversation as Conversation).user).first);
                    }
                  }
                });
              },
              child: Icon(Icons.chat),
              backgroundColor: Utils.appBarMobile,
            )
          : null,
    );
  }

  void jumpToConversation(Conversation conversation) {
    if (widget.isMobile) {
      Navigator.of(context).push(AnimatedRoute(
        widget: ChatScreen(context: context, conversation: conversation, refresh: widget.refresh),
        anim: PageAnimation.FADE_SCALE,
      ));
      widget.callback(conversation);
    } else {
      widget.callback(conversation);
    }
  }

  bool _userNotInChats(Conversation conversation) {
    int matches = 0;
    _conversations.forEach((element) {
      if (element.user.name == conversation.user.name) matches = ++matches;
    });
    return matches == 0;
  }

  Widget _appBar(Size size, bool isMobile) {
    return PreferredSize(
      preferredSize: Size(size.width, 111),
      child: Material(
        color: isMobile ? Utils.appBarMobile : Utils.appBarLaptop,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  isMobile
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text('WhatsApp', style: TextStyle(fontSize: 20, color: Colors.white)),
                        )
                      : GestureDetector(
                          onTap: () => Navigator.of(context).push(AnimatedRoute(
                            widget: ProfileScreen(user: Utils.currentUser),
                            anim: PageAnimation.FROM_LEFT,
                          )),
                          child: _avatar(
                            Utils.mariano.avatar,
                            EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                          ),
                        ),
                  Expanded(child: SizedBox()),
                  for (var action in isMobile ? _mobileActions : _laptopActions) action
                ],
              ),
            ),
            isMobile ? _tabsSection() : _searchSection(),
            isMobile ? SizedBox() : Container(height: 1, color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }

  Widget _avatar(String url, EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(url, fit: BoxFit.cover),
        ),
      ),
    );
  }

  void _loadActions() {
    Future.delayed(Duration(seconds: 0), () {
      if (widget.isMobile) {
        setState(() {
          _mobileActions.addAll([
            Utils.action(Icons.search, () {}, widget.isMobile, smallDevice: false),
            Utils.action(Icons.more_vert, () {}, widget.isMobile, smallDevice: false),
          ]);
        });
      } else {
        setState(() {
          _laptopActions.addAll([
            Utils.action(Icons.play_circle_outline, () {}, widget.isMobile, smallDevice: false),
            Utils.action(Icons.chat, () {
              Navigator.of(context)
                  .push(AnimatedRoute(
                widget: ContactsScreen(isMobile: widget.isMobile),
                anim: PageAnimation.FROM_LEFT,
              ))
                  .then((conversation) {
                if (conversation != null) {
                  if (_userNotInChats(conversation)) {
                    setState(() => _conversations.add(conversation));
                    sortConversations();
                    jumpToConversation(conversation);
                  } else {
                    jumpToConversation(
                        _conversations.where((element) => element.user == (conversation as Conversation).user).first);
                  }
                }
              });
            }, widget.isMobile, smallDevice: false),
            Utils.action(Icons.more_vert, () {}, widget.isMobile, smallDevice: false),
          ]);
        });
      }
    });
  }

  void sortConversations() {
    setState(() {
      _conversations.sort((a, b) => b.lastTimestamp.compareTo(a.lastTimestamp));
    });
  }

  Widget _searchSection() {
    return Container(
      color: Utils.sectionSpacer,
      height: 50,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 35),
              child: Icon(Icons.search, size: 18, color: Utils.appBarIconLaptop),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search or start a new chat',
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabsSection() {
    return Container(
      height: 50,
      color: Utils.appBarMobile,
      child: DefaultTabController(
        length: 3,
        child: TabBar(
          tabs: [
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),
          ],
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final ConversationCallback callback;
  final bool isMobile;
  final User user;

  const ContactItem({Key key, this.callback, this.isMobile, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () => callback(Conversation(user, now, now, [])),
        child: Container(
          height: 70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(user.avatar),
                ),
              ),
              Container(
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(user.status,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.6))),
                      ),
                      SizedBox(height: 14),
                      Container(height: 1, color: Colors.grey[200]),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChatItem extends StatefulWidget {
  final bool isMobile;
  final RefreshCallback refresh;
  final Conversation conversation;
  final ConversationCallback callback;

  const ChatItem({Key key, @required this.isMobile, @required this.conversation, @required this.callback, this.refresh})
      : super(key: key);

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  var _isHover = false;

  @override
  Widget build(BuildContext context) {
    final smallDevice = MediaQuery.of(context).size.width < 360;
    return Material(
      child: InkWell(
        onTap: () {
          if (widget.isMobile) {
            Navigator.of(context).push(AnimatedRoute(
              widget: ChatScreen(context: context, conversation: widget.conversation, refresh: widget.refresh),
              anim: PageAnimation.FADE_SCALE,
            ));
            widget.callback(widget.conversation);
          } else {
            widget.callback(widget.conversation);
          }
        },
        child: MouseRegion(
          onHover: (_) => setState(() => _isHover = true),
          onExit: (_) => setState(() => _isHover = false),
          child: Container(
            height: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(widget.conversation.user.avatar),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.conversation.user.name,
                                  style: TextStyle(
                                    fontSize: smallDevice ? 14 : 16,
                                    fontWeight:
                                        _lastMessageUnread(widget.conversation) ? FontWeight.w600 : FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child:
                                    Text(widget.conversation.chats.isNotEmpty ? _parseTime(widget.conversation) : ''),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              if (_lastMessageMine(widget.conversation))
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Utils.doubleCheck(widget.conversation.user.online, false),
                                ),
                              Expanded(
                                child: Text(
                                  widget.conversation.chats.isNotEmpty ? widget.conversation.chats[0].text : '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      height: 1.2,
                                      fontSize: smallDevice ? 12 : 14,
                                      fontWeight: FontWeight.w500,
                                      color: _lastMessageMine(widget.conversation)
                                          ? Colors.black.withOpacity(0.6)
                                          : _countUnread(widget.conversation) > 0
                                              ? Colors.black
                                              : Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              _countUnread(widget.conversation) > 0
                                  ? Container(
                                      height: 20,
                                      width: 20,
                                      margin: const EdgeInsets.only(left: 6),
                                      decoration: BoxDecoration(
                                        color: Utils.chatUnreadCount,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                          child: Text(
                                        '${_countUnread(widget.conversation)}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                    )
                                  : SizedBox(),
                              _isHover
                                  ? Container(
                                      width: 20,
                                      height: 30,
                                      margin: const EdgeInsets.only(left: 2),
                                      child: Icon(Icons.keyboard_arrow_down, color: Colors.grey[500]),
                                    )
                                  : SizedBox(),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(height: 1, color: Colors.grey[200]),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _parseTime(Conversation chat) =>
      '${DateTime.fromMillisecondsSinceEpoch(chat.chats[0].timestamp).hour}:${DateTime.fromMillisecondsSinceEpoch(chat.chats[0].timestamp).minute}';

  bool _lastMessageMine(Conversation conversation) {
    conversation.chats.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return conversation.chats.isNotEmpty ? conversation.chats[0].user == Utils.currentUser : false;
  }

  bool _lastMessageUnread(Conversation conversation) {
    conversation.chats.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return conversation.chats.isNotEmpty ? conversation.chats[0].timestamp > conversation.lastSeen : false;
  }

  int _countUnread(Conversation conversation) =>
      conversation.chats.where((item) => item.timestamp > conversation.lastSeen).length;
}

class ChatScreen extends StatefulWidget {
  final BuildContext context;
  final RefreshCallback refresh;
  final Conversation conversation;
  final GlobalKey<ContactScreenState> contact;

  const ChatScreen({Key key, this.context, this.refresh, this.conversation, this.contact}) : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  var _textController = TextEditingController();
  var _rightAction = Icons.keyboard_voice;
  var _visible = false;
  var _isMobile = false;
  var _smallDevice = false;

  Conversation _conversation;

  List<Widget> _mobileActions = [];
  List<Widget> _laptopActions = [];

  void setConversation(Conversation conversation) => setState(() => _conversation = conversation);

  @override
  void initState() {
    super.initState();
    if (widget.conversation != null) {
      Future.delayed(Duration(seconds: 0), () => setState(() => _conversation = widget.conversation));
    }
    Future.delayed(Duration(seconds: 0), () {
      if (_isMobile) {
        setState(() {
          _mobileActions.addAll([
            Utils.action(Icons.videocam, () {}, _isMobile, smallDevice: _smallDevice),
            Utils.action(Icons.call, () {}, _isMobile, smallDevice: _smallDevice),
            Utils.action(Icons.more_vert, () {}, _isMobile, smallDevice: _smallDevice),
          ]);
        });
      } else {
        setState(() {
          _laptopActions.addAll([
            Utils.action(Icons.search, () {}, _isMobile, smallDevice: false),
            Utils.action(Icons.attach_file, () {}, _isMobile, smallDevice: false),
            Utils.action(Icons.more_vert, () {}, _isMobile, smallDevice: false),
          ]);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _isMobile = size.width < 720;
    _smallDevice = size.width < 360;
    return Scaffold(
      appBar: _conversation != null ? _appBar(_conversation.user, size, _isMobile) : null,
      body: _conversation != null
          ? Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  width: size.width,
                  color: Utils.chatBackground,
                  child: Opacity(
                    opacity: 0.06,
                    child: Image.network(
                      'https://web.whatsapp.com/img/bg-chat-tile_9e8a2898faedb7db9bf5638405cf81ae.png',
                      repeat: ImageRepeat.repeatX,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: size.width * 0.02),
                        itemBuilder: (context, index) {
                          final chat = _conversation.chats[index];
                          return _chatItem(chat, _smallDevice);
                        },
                        itemCount: _conversation.chats.length,
                      ),
                    ),
                    _bottomSection(),
                  ],
                ),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                            'https://web.whatsapp.com/img/intro-connection-hq_9466a20e6d2921a21ac7ab82419be157.jpg',
                            width: 250),
                        SizedBox(height: 20),
                        Text('Keep your phone connected', textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
                        SizedBox(height: 15),
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                              'WhatsApp connects to your phone to sync messages. To reduce data usage, connect your phone to'
                              ' Wi-Fi.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13)),
                        ),
                        SizedBox(height: 30),
                        Container(height: 1, color: Colors.grey[300]),
                        SizedBox(height: 30),
                        Opacity(
                          opacity: 0.5,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.laptop_mac, size: 18),
                              SizedBox(width: 10),
                              Flexible(
                                flex: 1,
                                child: Text('WhatsApp is available for Laptops', textAlign: TextAlign.center),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 6, color: Utils.connected)
              ],
            ),
    );
  }

  Widget _chatItem(Chat chat, bool smallDevice) {
    return Align(
      alignment: _currentUser(chat) ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: chat.firstSection ? 15 : 2),
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: chat.firstSection && !_currentUser(chat) ? Radius.circular(0) : Radius.circular(8),
            topRight: chat.firstSection && _currentUser(chat) ? Radius.circular(0) : Radius.circular(8),
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          color: _currentUser(chat) ? Utils.chatSelf : Colors.white,
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: _singleEmoji(chat) ? 0 : 12, bottom: 2),
              child: Text(chat.text,
                  style: TextStyle(fontSize: _singleEmoji(chat) ? _smallDevice ? 30 : 50 : _smallDevice ? 12 : 14)),
            ),
            SizedBox(width: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Text(_parseTime(chat.timestamp), style: TextStyle(fontSize: 11)),
                ),
                SizedBox(width: 5),
                if (_currentUser(chat)) Utils.doubleCheck(_conversation.user.online, true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomSection() {
    return _isMobile
        ? Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.insert_emoticon, color: Colors.grey[600]),
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          onChanged: (text) {
                            setState(() => _rightAction = text.length > 0 ? Icons.send : Icons.keyboard_voice);
                          },
                          onSubmitted: (text) {
                            if (text.length > 0) {
                              setState(() {
                                _textController.clear();
                                _conversation.chats.insert(
                                    0,
                                    Chat(Utils.currentUser, text, DateTime.now().millisecondsSinceEpoch,
                                        _firstInSection(_conversation)));
                                _rightAction = Icons.keyboard_voice;
                              });
                              Future.delayed(Duration(milliseconds: 100), () => widget.refresh(_conversation));
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Type a message',
                            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                          ),
                          style: TextStyle(height: 1.2),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.attach_file, color: Colors.grey[700]),
                      SizedBox(width: 15),
                      Icon(Icons.camera_alt, color: Colors.grey[700]),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
              ),
              InkResponse(
                onTap: () {
                  setState(() {
                    if (_textController.text.length > 0) {
                      _textController.clear();
                      _conversation.chats.insert(
                          0,
                          Chat(Utils.currentUser, _textController.text, DateTime.now().millisecondsSinceEpoch,
                              _firstInSection(_conversation)));
                      _rightAction = Icons.keyboard_voice;
                    }
                  });
                  Future.delayed(Duration(milliseconds: 100), () => widget.refresh(_conversation));
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Utils.appBarMobile,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(_rightAction, color: Colors.white),
                ),
              ),
              SizedBox(width: 10),
            ],
          )
        : Material(
            color: Utils.laptopBottomChatBar,
            child: Container(
              height: 60,
              child: Row(
                children: [
                  SizedBox(width: 18),
                  Icon(Icons.insert_emoticon, size: 30, color: Colors.grey[500]),
                  SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                      child: Container(
                        child: TextField(
                          controller: _textController,
                          onChanged: (text) {
                            setState(() => _rightAction = text.length > 0 ? Icons.send : Icons.keyboard_voice);
                          },
                          onSubmitted: (text) {
                            if (text.length > 0) {
                              setState(() {
                                _textController.clear();
                                _conversation.chats.insert(
                                    0,
                                    Chat(Utils.currentUser, text, DateTime.now().millisecondsSinceEpoch,
                                        _firstInSection(_conversation)));
                                _rightAction = Icons.keyboard_voice;
                              });
                              Future.delayed(Duration(milliseconds: 100), () => widget.refresh(_conversation));
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Type a message',
                            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                          ),
                          style: TextStyle(height: 1.2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  InkResponse(
                    onTap: () {
                      setState(() {
                        if (_textController.text.length > 0) {
                          _textController.clear();
                          _conversation.chats.insert(
                              0,
                              Chat(Utils.currentUser, _textController.text, DateTime.now().millisecondsSinceEpoch,
                                  _firstInSection(_conversation)));
                          _rightAction = Icons.keyboard_voice;
                        }
                      });
                      Future.delayed(Duration(milliseconds: 100), () => widget.refresh(_conversation));
                    },
                    child: Icon(_rightAction, size: 30, color: Colors.grey[500]),
                  ),
                  SizedBox(width: 18),
                ],
              ),
            ),
          );
  }

  bool _firstInSection(Conversation conversation) {
    var prevChat = conversation.chats.isNotEmpty ? conversation.chats[0] : null;
    if (prevChat != null) {
      return prevChat.user != Utils.currentUser;
    } else {
      return true;
    }
  }

  bool _singleEmoji(Chat chat) {
    if (Utils.regexAlphaNum.hasMatch(chat.text)) {
      return false;
    } else {
      return Utils.regexpEmoji.hasMatch(chat.text);
    }
  }

  bool _currentUser(Chat chat) => chat.user == Utils.currentUser;

  Widget _appBar(User user, Size size, bool isMobile) {
    return PreferredSize(
      preferredSize: Size(size.width, 60),
      child: Container(
        height: 60,
        child: Material(
          color: isMobile ? Utils.appBarMobile : Utils.appBarLaptop,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: isMobile ? 10 : 20),
              if (isMobile)
                InkResponse(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.arrow_back, color: Utils.appBarIconMobile, size: _smallDevice ? 15 : 25),
                  ),
                ),
              _avatar(_smallDevice),
              SizedBox(width: _smallDevice ? 10 : 20),
              _conversation != null
                  ? GestureDetector(
                      onTap: () {
                        if (widget.contact != null) {
                          _visible = !_visible;
                          widget.contact.currentState.setUser(user);
                          widget.contact.currentState.setVisible(_visible);
                        } else {
                          Navigator.of(widget.context).push(AnimatedRoute(
                            widget: ContactScreen(user: user, visible: true),
                            anim: isMobile ? PageAnimation.FADE_SCALE : PageAnimation.FROM_RIGHT,
                          ));
                        }
                      },
                      child: Container(
                        height: _smallDevice ? 36 : 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 2),
                            Expanded(
                                child: Text(_conversation.user.name,
                                    style: TextStyle(
                                      fontSize: _smallDevice ? 14 : 16,
                                      color: isMobile ? Colors.white : Colors.black,
                                    ))),
                            Text(
                                _conversation.user.online
                                    ? 'online'
                                    : 'last seen at ${_parseTime(_conversation.user.lastConnection)}',
                                style: TextStyle(
                                    color: isMobile ? Colors.white : Colors.grey[700],
                                    fontSize: _smallDevice ? 12 : 13)),
                            SizedBox(height: 1),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(),
              Expanded(child: SizedBox()),
              for (var action in _isMobile ? _mobileActions : _laptopActions) action
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatar(bool smallDevice) {
    return Container(
      width: smallDevice ? 30 : 40,
      height: smallDevice ? 30 : 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(smallDevice ? 15 : 20),
        child: _conversation != null ? Image.network(_conversation.user.avatar, fit: BoxFit.cover) : SizedBox(),
      ),
    );
  }

  String _parseTime(int lastConnection) => '${DateTime.fromMillisecondsSinceEpoch(lastConnection).hour}'
      ':${DateTime.fromMillisecondsSinceEpoch(lastConnection).minute}';
}

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 110),
        child: Container(
          height: 110,
          color: Utils.softGreen,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: 25),
                InkResponse(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
                SizedBox(width: 25),
                Text('Profile', style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          color: Utils.sectionSpacer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(widget.user.avatar, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 25),
              Container(height: 1, width: size.width, color: Color(0x40EAEAEA)),
              Container(
                width: size.width,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text('Your Name', style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    SizedBox(height: 20),
                    Text(widget.user.name, style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 18)),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Container(height: 2, width: size.width, color: Utils.sectionDivider),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text('This is not your username or pin. This name will be visible to your WhatsApp contacts.',
                    style: TextStyle(color: Colors.black.withOpacity(0.5))),
              ),
              Container(height: 1, width: size.width, color: Color(0x40EAEAEA)),
              Container(
                width: size.width,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text('About', style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    SizedBox(height: 20),
                    Text(widget.user.status, style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 18)),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Container(height: 2, width: size.width, color: Utils.sectionDivider),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactsScreen extends StatefulWidget {
  final bool isMobile;

  const ContactsScreen({Key key, this.isMobile}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final List<User> _contacts = [
    Utils.codePen,
    Utils.flutter,
    Utils.flutterFlakes,
    Utils.flutterNYC,
    Utils.martin,
    Utils.nilay,
    Utils.rFlutterDev,
    Utils.tim,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 720;
    final smallDevice = size.width < 360;
    return Scaffold(
      appBar: _appBar(size, smallDevice),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          final user = _contacts[index];
          return ContactItem(
              isMobile: isMobile,
              user: user,
              callback: (conversation) {
                Navigator.of(context).pop(conversation);
              });
        },
        itemCount: _contacts.length,
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _appBar(Size size, bool smallDevice) {
    return PreferredSize(
      preferredSize: Size(size.width, widget.isMobile ? 60 : 110),
      child: widget.isMobile
          ? Container(
              height: 60,
              color: Utils.appBarMobile,
              child: Row(
                children: [
                  SizedBox(width: smallDevice ? 15 : 25),
                  InkResponse(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.arrow_back, color: Colors.white, size: smallDevice ? 15 : 25),
                  ),
                  SizedBox(width: smallDevice ? 15 : 25),
                  Text('Select contact', style: TextStyle(color: Colors.white, fontSize: smallDevice ? 14 : 18)),
                  Expanded(child: SizedBox()),
                  Utils.action(Icons.search, () {}, widget.isMobile, smallDevice: smallDevice),
                  Utils.action(Icons.more_vert, () {}, widget.isMobile, smallDevice: smallDevice)
                ],
              ),
            )
          : Container(
              height: 110,
              color: Utils.softGreen,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(width: 25),
                    InkResponse(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    SizedBox(width: 25),
                    Text('New chat', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            ),
    );
  }
}

class ContactScreen extends StatefulWidget {
  final User user;
  final visible;

  const ContactScreen({Key key, this.user, this.visible}) : super(key: key);

  @override
  ContactScreenState createState() => ContactScreenState();
}

class ContactScreenState extends State<ContactScreen> {
  User _user;

  User get user => _user;

  void setUser(User user) => setState(() => _user = user);

  bool _isVisible = false;

  bool get isVisible => _isVisible;

  void setVisible(bool visible) => setState(() => _isVisible = visible);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () => setState(() => _isVisible = widget.visible));
    Future.delayed(Duration(seconds: 0), () => setState(() => _user = widget.user));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 720;
    return Visibility(
      visible: _isVisible,
      child: Container(
        width: 350,
        child: Scaffold(
          appBar: !isMobile ? _appBar(size) : null,
          body: Container(
            color: Colors.white,
            width: size.width,
            child: _user != null
                ? Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: isMobile
                                  ? [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 350,
                                            width: size.width,
                                            child: Image.network(_user.avatar, fit: BoxFit.cover),
                                          ),
                                          Container(
                                            height: 350,
                                            width: size.width,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                              colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.8)],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            )),
                                          ),
                                          Opacity(
                                            opacity: 0.99,
                                            child: Container(
                                              height: 350,
                                              width: size.width,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    SizedBox(height: 2),
                                                    Text(_user.name,
                                                        style: TextStyle(fontSize: 18, color: Colors.white)),
                                                    SizedBox(height: 4),
                                                    Text(
                                                        _user.online
                                                            ? 'online'
                                                            : 'last seen at ${_parseTime(_user.lastConnection)}',
                                                        style: TextStyle(color: Colors.white, fontSize: 14)),
                                                    SizedBox(height: 1),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]
                                  : [
                                      SizedBox(height: 30),
                                      Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: Image.network(_user.avatar, fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        height: 50,
                                        width: size.width,
                                        margin: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 2),
                                            Expanded(
                                                child: Text(_user.name,
                                                    style: TextStyle(fontSize: 18, color: Colors.black))),
                                            Text(
                                                _user.online
                                                    ? 'online'
                                                    : 'last seen at ${_parseTime(_user.lastConnection)}',
                                                style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                                            SizedBox(height: 1),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                            ),
                            Container(height: 2, width: size.width, color: Utils.sectionDivider),
                            Container(height: 8, width: size.width, color: Utils.sectionSpacer),
                            Container(height: 1, width: size.width, color: Utils.sectionDivider),
                            SizedBox(height: 10),
                            Container(
                              width: size.width,
                              margin: const EdgeInsets.only(left: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('About and phone number',
                                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                                  SizedBox(height: 15),
                                  Text(_user.status, style: TextStyle(color: Colors.black.withOpacity(0.8))),
                                  SizedBox(height: 15),
                                  Container(height: 1, width: size.width, color: Utils.sectionDivider),
                                  SizedBox(height: 15),
                                  Text(_user.phone, style: TextStyle(color: Colors.black, fontSize: 16)),
                                  SizedBox(height: 15),
                                ],
                              ),
                            ),
                            Container(height: 2, width: size.width, color: Utils.sectionDivider),
                            Container(height: 8, width: size.width, color: Utils.sectionSpacer),
                            Container(height: 1, width: size.width, color: Utils.sectionDivider),
                            contactSection(size, Icons.block, 'Block', Colors.black),
                            contactSection(size, Icons.thumb_down, 'Report contact', Colors.red[700]),
                            contactSection(size, Icons.delete, 'Delete chat', Colors.red[700]),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Container(
                          height: 60,
                          width: size.width,
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              InkResponse(
                                onTap: () => Navigator.of(context).pop(),
                                child: Icon(Icons.arrow_back, color: Colors.white),
                              ),
                              Expanded(child: Container()),
                              InkResponse(onTap: () {}, child: Icon(Icons.more_vert, color: Colors.white)),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ),
        ),
      ),
    );
  }

  Widget _appBar(Size size) {
    final isTablet = size.width < 1100;
    return PreferredSize(
      preferredSize: Size(size.width, 60),
      child: Material(
        color: Utils.appBarLaptop,
        child: Container(
          height: 60,
          child: Row(
            children: [
              SizedBox(width: 20),
              InkResponse(
                onTap: () => isTablet ? Navigator.of(context).pop() : setState(() => _isVisible = false),
                child: Icon(Icons.close, color: Utils.appBarIconLaptop),
              ),
              SizedBox(width: 20),
              Text('Contact info', style: TextStyle(fontSize: 16, color: Colors.black)),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactSection(Size size, IconData icon, String text, Color color) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 71,
          width: size.width,
          child: Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(icon, color: icon == Icons.block ? Colors.grey[500] : color),
                    SizedBox(width: 30),
                    Text(text, style: TextStyle(fontSize: 17, color: color)),
                  ],
                ),
              ),
              Container(height: 2, width: size.width, color: Utils.sectionDivider),
              Container(height: 8, width: size.width, color: Utils.sectionSpacer),
              Container(height: 1, width: size.width, color: Utils.sectionDivider),
            ],
          ),
        ),
      ),
    );
  }

  String _parseTime(int lastConnection) => '${DateTime.fromMillisecondsSinceEpoch(lastConnection).hour}'
      ':${DateTime.fromMillisecondsSinceEpoch(lastConnection).minute}';
}

enum PageAnimation { SCALE, FADE, FADE_SCALE, FROM_RIGHT, FROM_LEFT }

class AnimatedRoute extends PageRouteBuilder {
  final Widget widget;
  final int duration;
  final PageAnimation anim;

  static CurveTween decelerate = CurveTween(curve: Curves.decelerate);

  AnimatedRoute({@required this.widget, this.duration = 200, @required this.anim})
      : super(
            pageBuilder: (context, animation, secondary) => widget,
            transitionDuration: Duration(milliseconds: duration),
            transitionsBuilder: (context, animation, secondary, child) {
              return when(anim, {
                PageAnimation.SCALE: ScaleTransition(
                  scale: animation.drive(Tween(begin: 0.9, end: 1.0).chain(decelerate)),
                  child: child,
                ),
                PageAnimation.FADE: FadeTransition(
                  opacity: animation.drive(Tween(begin: 0.0, end: 1.0).chain(decelerate)),
                  child: child,
                ),
                PageAnimation.FADE_SCALE: FadeTransition(
                  opacity: animation.drive(Tween(begin: 0.0, end: 1.0).chain(decelerate)),
                  child: ScaleTransition(
                    scale: animation.drive(Tween(begin: 0.9, end: 1.0).chain(decelerate)),
                    child: child,
                  ),
                ),
                PageAnimation.FROM_LEFT: SlideTransition(
                  position: animation.drive(Tween(begin: Offset(-1.0, 0.0), end: Offset.zero).chain(decelerate)),
                  child: child,
                ),
                PageAnimation.FROM_RIGHT: SlideTransition(
                  position: animation.drive(Tween(begin: Offset(1.0, 0.0), end: Offset.zero).chain(decelerate)),
                  child: child,
                ),
              });
            });
}

Type when<Input, Type>(Input selectedOption, Map<Input, Type> branches, [Type defaultValue]) {
  if (!branches.containsKey(selectedOption)) {
    return defaultValue;
  }
  return branches[selectedOption];
}
