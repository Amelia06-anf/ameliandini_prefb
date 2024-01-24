import 'dart:convert';

class DetailModel {
  final String nama;
  final String alamat;
  final int umur;
  final String hobi;
  DetailModel({
    this.nama = '',
    this.alamat = '',
    this.umur = 0,
    this.hobi = '',
  });

  DetailModel copyWith({
    String? nama,
    String? alamat,
    int? umur,
    String? hobi,
  }) {
    return DetailModel(
      nama: nama ?? this.nama,
      alamat: alamat ?? this.alamat,
      umur: umur ?? this.umur,
      hobi: hobi ?? this.hobi,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nama': nama});
    result.addAll({'alamat': alamat});
    result.addAll({'umur': umur});
    result.addAll({'hobi': hobi});

    return result;
  }

  factory DetailModel.fromMap(Map<String, dynamic> map) {
    return DetailModel(
      nama: map['nama'] ?? '',
      alamat: map['alamat'] ?? '',
      umur: map['umur']?.toInt() ?? 0,
      hobi: map['hobi'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailModel.fromJson(String source) => DetailModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DetailModel(nama: $nama, alamat: $alamat, umur: $umur, hobi: $hobi)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailModel &&
        other.nama == nama &&
        other.alamat == alamat &&
        other.umur == umur &&
        other.hobi == hobi;
  }

  @override
  int get hashCode {
    return nama.hashCode ^ alamat.hashCode ^ umur.hashCode ^ hobi.hashCode;
  }
}
