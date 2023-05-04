import 'package:html/parser.dart';

const AppName = "Find My CoFounder";

/// DO NOT CHANGE THIS PACKAGE NAME
const APP_PACKAGE_NAME = "com.findmycofounders";

AppThemeMode appThemeMode = AppThemeMode();

const tokenStream = 'tokenStream';
const PER_PAGE = 10;
const OnAddPost = 'OnAddPost';

const String robotoRegular = "Roboto-Regular";
const String robotoBold = "Roboto-Bold";

class Users {
  static String username = 'username';
  static String password = 'password';
}

const OnAddPostProfile = 'OnAddPostProfile';

class PostActivityType {
  static String activityUpdate = 'activity_update';
  static String mppMediaUpload = 'mpp_media_upload';
  static String activityShare = 'activity_share';
  static String newBlogPost = 'new_blog_post';
}

class Component {
  static String groups = 'groups';
  static String activity = 'activity';
  static String friends = 'friends';
  static String blogs = 'blogs';
  static String members = 'members';
  static String activityLike = 'socialv_activity_like_notification';
  static String verifiedMember = 'bp_verified_member';
  static String forums = 'forums';
  static String media = 'media';
  static String gallery = 'gallery';
}

class PostRequestType {
  static String all = 'all';
  static String timeline = 'timeline';
  static String group = 'groups';
  static String singleActivity = 'single-activity';
}

/// Demo Login
const DEMO_USER_EMAIL = "jerry@gmail.com";
const DEMO_USER_PASSWORD = "123456";

class AppThemeMode {
  final int themeModeLight = 1;
  final int themeModeDark = 2;
  final int themeModeSystem = 0;
}

String parseHtmlString(String? htmlString) {
  return parse(parse(htmlString).body!.text).documentElement!.text;
}

class SharePreferencesKey {
  static const USERID = 'USERID';
  static const FIRSTNAME = 'FIRSTNAME';
  static const LASTNAME = 'LASTNAME';
  static const EMAIL = 'EMAIL';
  static const USERNAME = 'USERNAME';
  static const PROFILE = 'PROFILE';
  static const USER_TYPE = 'USER_TYPE';
  static const LOOKING_FOR = 'LOOKING_FOR';

  static const TOKEN = 'TOKEN';
  static const NONCE = 'NONCE';
  static const VERIFICATION_STATUS = 'VERIFICATION_STATUS';
  static const IS_LOGGED_IN = 'IS_LOGGED_IN';
  static const WOO_CURRENCY = 'WOO_CURRENCY';
  static const GIPHY_API_KEY = 'GIPHY_API_KEY';

  static const REMEMBER_ME = 'REMEMBER_ME';

  static const LOGIN_EMAIL = 'LOGIN_EMAIL';
  static const LOGIN_PASSWORD = 'LOGIN_PASSWORD';
  static const LOGIN_FULL_NAME = 'LOGIN_FULL_NAME';
  static const LOGIN_DISPLAY_NAME = 'LOGIN_DISPLAY_NAME';
  static const LOGIN_USER_ID = 'LOGIN_USER_ID';
  static const LOGIN_AVATAR_URL = 'LOGIN_AVATAR_URL';
  static const APP_THEME = 'APP_THEME';
  static const IS_DARK_MODE = 'IS_DARK_MODE';
  static const LANGUAGE = "LANGUAGE";

  static const RECENT_SEARCH_MEMBERS = 'RECENT_SEARCH_MEMBERS';
  static const RECENT_SEARCH_GROUPS = 'RECENT_SEARCH_GROUPS';
  static const ONE_SIGNAL_PLAYER_ID = 'ONE_SIGNAL_PLAYER_ID';
}

class ProductFilters {
  static String clear = 'clear';
  static String date = 'date';
  static String price = 'price';
  static String popularity = 'popularity';
  static String rating = 'rating';
}

class OrderStatus {
  static String any = 'any';
  static String pending = 'pending';
  static String processing = 'processing';
  static String onHold = 'on-hold';
  static String completed = 'completed';
  static String cancelled = 'cancelled';
  static String refunded = 'refunded';
  static String failed = 'failed';
  static String trash = 'trash';
}

class APIEndPoint {
  static const login = 'jwt-auth/v1/token';
  static const getMembers = 'buddypress/v1/members';
  static const getGroups = 'buddypress/v1/groups';
  static const coverImage = 'cover';
  static const avatarImage = 'avatar';
  static const groupInvites = 'invites';
  static const groupMembers = 'members';
  static const groupMembershipRequests = 'membership-requests';
  static const getFriends = 'buddypress/v1/friends';
  static const getNotifications = 'buddypress/v1/notifications';
  static const socialLogin = 'socialv-api/api/v1/socialv/social-login';
  static const signup = 'socialv-api/api/v1/socialv/register-user';
  static const posts = 'socialv-api/api/v1/socialv/get-post';
  static const singlePosts = 'socialv-api/api/v1/socialv/get-post-details';
  static const createPosts = 'socialv-api/api/v1/socialv/create-post';
  static const getAllPostLike =
      'socialv-api/api/v1/socialv/get-all-user-who-liked-post';
  static const likePost = 'socialv-api/api/v1/socialv/like-activity';
  static const deletePost = 'socialv-api/api/v1/socialv/delete-post';
  static const deletePostComment =
      'socialv-api/api/v1/socialv/delete-post-comment';
  static const savePostComment = 'socialv-api/api/v1/socialv/save-post-comment';
  static const getPostComment =
      'socialv-api/api/v1/socialv/get-posts-all-comment';
  static const supportedMediaList =
      'socialv-api/api/v1/socialv/get-supported-media-list';
  static const getPostInList = 'socialv-api/api/v1/socialv/get-post-in-list';
  static const getGroupList = 'socialv-api/api/v1/socialv/get-group-list';
  static const getGroupDetail = 'socialv-api/api/v1/socialv/get-group-details';
  static const getGroupMembersList =
      'socialv-api/api/v1/socialv/get-group-members-list';
  static const getGroupRequests =
      'socialv-api/api/v1/socialv/get-membership-request';
  static const getGroupInvites =
      'socialv-api/api/v1/socialv/get-invite-user-list';
  static const getMemberDetail =
      'socialv-api/api/v1/socialv/get-member-details';
  static const getFriendList =
      'socialv-api/api/v1/socialv/get-member-friends-list';
  static const getFriendRequestList =
      'socialv-api/api/v1/socialv/get-friendship-request-list';
  static const getFriendRequestSent =
      'socialv-api/api/v1/socialv/get-friend-request-sent-list';
  static const manageInvitation =
      'socialv-api/api/v1/socialv/group-manage-invitation';
  static const getDashboard = 'socialv-api/api/v1/socialv/get-dashboard';
  static const getProfileFields =
      'socialv-api/api/v1/socialv/get-profile-fields';
  static const saveProfileFields =
      'socialv-api/api/v1/socialv/update-profile-settings';
  static const getProfileVisibility =
      'socialv-api/api/v1/socialv/get-profile-visibility-settings';
  static const saveProfileVisibility =
      'socialv-api/api/v1/socialv/save-profile-visibility-settings';
  static const changePassword = 'socialv-api/api/v1/socialv/change-password';
  static const forgetPassword = 'socialv-api/api/v1/socialv/forgot-password';
  static const notifications =
      'socialv-api/api/v1/socialv/get-notifications-list';
  static const setPlayerId =
      'socialv-api/api/v1/socialv/manage-user-player-ids';
  static const getNotificationSettings =
      'socialv-api/api/v1/socialv/get-notification-settings';
  static const saveNotificationSettings =
      'socialv-api/api/v1/socialv/save-notification-settings';
  static const deleteAccount = 'socialv-api/api/v1/socialv/delete-account';
  static const addStory = 'socialv-api/api/v1/socialv/add-story';
  static const getUserStories = 'socialv-api/api/v1/socialv/get-stories';
  static const viewStory = 'socialv-api/api/v1/socialv/view-story';
  static const getStoryViews = 'socialv-api/api/v1/socialv/get-story-views';
  static const deleteStory = 'socialv-api/api/v1/socialv/delete-story';
  static const blockMemberAccount =
      'socialv-api/api/v1/socialv/block-member-account';
  static const reportPost = 'socialv-api/api/v1/socialv/report-post';
  static const reportUserAccount =
      'socialv-api/api/v1/socialv/report-user-account';
  static const reportGroup = 'socialv-api/api/v1/socialv/report-group';
  static const getBlockedMembers =
      'socialv-api/api/v1/socialv/get-blocked-members';
  static const productsList = 'wc/v3/products';
  static const productReviews = 'wc/v3/products/reviews';
  static const cartItems = 'wc/store/cart/items';
  static const cart = 'wc/store/cart';
  static const applyCoupon = 'wc/store/cart/apply-coupon';
  static const removeCoupon = 'wc/store/cart/remove-coupon';
  static const coupons = 'wc/v3/coupons';
  static const addCartItems = 'wc/store/cart/add-item';
  static const removeCartItems = 'wc/store/cart/remove-item';
  static const updateCartItems = 'wc/store/cart/update-item';
  static const getPaymentMethods = 'wc/v3/payment_gateways';
  static const categories = 'wc/v3/products/categories';
  static const orders = 'wc/v3/orders';
  static const customers = 'wc/v3/customers';
  static const storeNonce = 'socialv-api/api/v1/socialv/get-store-api-nonce';
  static const wishlist = 'socialv-api/api/v1/socialv/get-wishlist-product';
  static const removeFromWishlist =
      'socialv-api/api/v1/socialv/remove-from-wishlist';
  static const addToWishlist = 'socialv-api/api/v1/socialv/add-to-wishlist';
  static const productDetails =
      'socialv-api/api/v1/socialv/get-product-details';
  static const countries = 'wc/v3/data/countries';
  static const forums = 'socialv-api/api/v1/socialv/get-all-forums';
  static const forumDetails = 'socialv-api/api/v1/socialv/get-forum-details';
  static const subscribeForum = 'socialv-api/api/v1/socialv/subscribe';
  static const createForumsTopic =
      'socialv-api/api/v1/socialv/create-forums-topic';
  static const topicDetails = 'socialv-api/api/v1/socialv/get-topic-details';
  static const favoriteTopic = 'socialv-api/api/v1/socialv/favorite-topic';
  static const replyTopic = 'socialv-api/api/v1/socialv/reply-forums-topic';
  static const editTopicReply = 'socialv-api/api/v1/socialv/edit-topic-reply';
  static const subscriptionList =
      'socialv-api/api/v1/socialv/subscription-list';
  static const forumRepliesList =
      'socialv-api/api/v1/socialv/get-topic-reply-list';
  static const topicList = 'socialv-api/api/v1/socialv/get-topic-list';
  static const verificationRequest =
      'socialv-api/api/v1/socialv/member-request-verification';
  static const deleteAlbumMedia =
      'socialv-api/api/v1/socialv/delete-album-media';
  static const hidePost = 'socialv-api/api/v1/socialv/hide-post';
  static const updateActiveStatus =
      'socialv-api/api/v1/socialv/update-active-status';
  static const getUserList = 'socialv-api/api/v1/socialv/get-user-list';
  static const refuseUserSuggestion =
      'socialv-api/api/v1/socialv/refuse-user-suggestion';
  static const getHighlightCategory =
      'socialv-api/api/v1/socialv/get-highlight-category';
  static const wpPost = 'wp/v2/posts';
  static const activity = 'buddypress/v1/activity';
  static const getHighlightStories =
      'socialv-api/api/v1/socialv/get-highlight-stories';
}
