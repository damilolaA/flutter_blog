
dynamic parseDate(dynamic date) {
  if(date is DateTime) {
    return date.millisecondsSinceEpoch;
  }else if(date is int) {
    return date;
  }else if(date is String) {
    try{
      return DateTime.parse(date).millisecondsSinceEpoch;
    }catch(error) {
      print('parse error $error');
      return throw(error);
    }
  }
  return null;
}