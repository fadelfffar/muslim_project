class PrayerResponse {
  List<String>? prayerTime;

  PrayerResponse({
    required this.prayerTime,
  });
  PrayerResponse.fromJson(Map<String, dynamic> json) {
    prayerTime = json['data']['jadwal'];
  }
}

class Prayer {
  late int id;
  late String lokasi;
  late String  daerah;
  late String  ashar;

  Prayer(
    {
      required this.id,
      required this.lokasi,
      required this.daerah,
      required this.ashar,
    }
  );
  Prayer.fromJson(Map<String, dynamic> json) {
    id = json['data']['id'];
    lokasi = json['data']['lokasi'];
    daerah = json['data']['daerah'];
    ashar = json['data']['jadwal']['ashar'];
  }
}