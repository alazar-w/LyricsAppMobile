class HomepageStat{
  int totalUser;
  int totalLyrics;
  int totalLyricsRequest;
  int totalApprovedLyrics;
  int totalUnApprovedLyrics;


  HomepageStat({this.totalUser, this.totalLyrics, this.totalLyricsRequest, this.totalApprovedLyrics, this.totalUnApprovedLyrics});

  factory HomepageStat.fromJson(Map<String, dynamic> json){
    return HomepageStat(
      totalUser: json['totalUser'],
      totalLyrics: json['totalLyrics'],
      totalLyricsRequest: json['totalLyricsRequest'],
      totalApprovedLyrics: json['totalApprovedLyrics'],
      totalUnApprovedLyrics: json['totalUnApprovedLyrics']
    );
  }

}