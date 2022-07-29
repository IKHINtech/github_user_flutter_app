class UserHeaders {
  int? totalCount;
  bool? incompleteResults;
  List<User>? items;

  UserHeaders({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });
  factory UserHeaders.fromJson(Map<String, dynamic> json) {
    List itemTemp = json['items'] ?? [];
    return UserHeaders(
        totalCount: json['total_count'],
        incompleteResults: json['incomplete_results'],
        items: List<User>.from(itemTemp.map((e) => User.fromJson(e))));
  }
}

class User {
  String? login;
  int? id;
  String? noteId;
  String? avatarUrl;
  String? gavatarUrl;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscrptionsUrl;
  String? organisationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventUrl;
  String? type;
  bool? siteAdmin;

  User({
    this.login,
    this.id,
    this.noteId,
    this.avatarUrl,
    this.gavatarUrl,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscrptionsUrl,
    this.organisationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventUrl,
    this.type,
    this.siteAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      login: json['login'],
      id: json['id'],
      noteId: json['note_id'],
      avatarUrl: json['avatar_url'],
      gavatarUrl: json['gavatar_url'],
      url: json['url'],
      htmlUrl: json['html_url'],
      followersUrl: json['followers_url'],
      followingUrl: json['folowing_url'],
      gistsUrl: json['gists_url'],
      starredUrl: json['starred_url'],
      subscrptionsUrl: json['subcriptions_url'],
      organisationsUrl: json['organisation_url'],
      reposUrl: json['repos_url'],
      eventsUrl: json['events_url'],
      receivedEventUrl: json['received_events_url'],
      type: json['type'],
      siteAdmin: json['site_admin']);
}

class UserDetails {
  String? login;
  int? id;
  String? noteId;
  String? avatarUrl;
  String? gavatarUrl;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscrptionsUrl;
  String? organisationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventUrl;
  String? type;
  bool? siteAdmin;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  bool? hireable;
  String? bio;
  String? twitterUsername;
  int? pubicRepos;
  int? publicGists;
  int? followers;
  int? following;
  String? createdAt;
  String? updatedAt;

  UserDetails(
      {this.login,
      this.id,
      this.noteId,
      this.avatarUrl,
      this.gavatarUrl,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscrptionsUrl,
      this.organisationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventUrl,
      this.type,
      this.siteAdmin,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.hireable,
      this.bio,
      this.twitterUsername,
      this.pubicRepos,
      this.publicGists,
      this.followers,
      this.following,
      this.createdAt,
      this.updatedAt});

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        login: json['login'],
        id: json['id'],
        noteId: json['note_id'],
        avatarUrl: json['avatar_url'],
        gavatarUrl: json['gavatar_url'],
        url: json['url'],
        htmlUrl: json['html_url'],
        followersUrl: json['followers_url'],
        followingUrl: json['folowing_url'],
        gistsUrl: json['gists_url'],
        starredUrl: json['starred_url'],
        subscrptionsUrl: json['subcriptions_url'],
        organisationsUrl: json['organisation_url'],
        reposUrl: json['repos_url'],
        eventsUrl: json['events_url'],
        receivedEventUrl: json['received_events_url'],
        type: json['type'],
        siteAdmin: json['site_admin'],
        name: json['name'],
        company: json['company'],
        blog: json['blog'],
        location: json['location'],
        email: json['email'],
        hireable: json['hireable'],
        bio: json['bio'],
        twitterUsername: json['twitter_username'],
        pubicRepos: json['public_repos'],
        publicGists: json['public_gists'],
        followers: json['followers'],
        following: json['following'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );
}
