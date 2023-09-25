library helpers;

class AuthToken {
  final String accessToken;
  final DateTime accessTokenExpires;
  final String? refreshToken;
  final DateTime? refreshTokenExpires;

  AuthToken({
    required this.accessToken,
    required this.accessTokenExpires,
    this.refreshToken,
    this.refreshTokenExpires,
  });

  bool isExpired() {
    return accessTokenExpires.difference(DateTime.now()).inMilliseconds <= 0;
  }

  bool isRefreshTokenExpired() {
    return refreshToken != null &&
        refreshTokenExpires != null &&
        refreshTokenExpires!.difference(DateTime.now()).inMilliseconds <= 0;
  }
}
