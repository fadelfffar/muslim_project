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
  final int id;
  final String lokasi;
  final String  daerah;
  final String  tanggal;
  final String  imsak;
  final String  subuh;
  final String  terbit;
  final String  dzuhur;
  final String  ashar;
  final String  maghrib;
  final String  isya;

  Prayer(
    {
      required this.id,
      required this.lokasi,
      required this.daerah,
      required this.tanggal,
      required this.imsak,
      required this.subuh,
      required this.terbit,
      required this.dzuhur,
      required this.ashar,
      required this.maghrib,
      required this.isya,
    }
  );
  factory Prayer.fromJson(Map<String, dynamic> json) {
    return Prayer(
      id : json['data']['id'],
      lokasi : json['data']['lokasi'],
      daerah : json['data']['daerah'],
      tanggal : json['data']['jadwal']['tanggal'],
      imsak : json['data']['jadwal']['imsak'],
      subuh : json['data']['jadwal']['subuh'],
      terbit : json['data']['jadwal']['terbit'],
      dzuhur : json['data']['jadwal']['dzuhur'],
      ashar : json['data']['jadwal']['ashar'],
      maghrib	 : json['data']['jadwal']['maghrib'],
      isya : json['data']['jadwal']['isya'],
    );
  }
}