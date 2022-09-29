
class ShoeData {
  final int id;
  final String name;
  String description;
  String application;
  String retail;
  String resell;
  String image;
  String url;
  String draw;
  String month;
  String day;
  String year;
  String hour;
  DateTime datetime;
  String time;

  ShoeData(
      {
        this.id,
        this.name,
        this.description,
        this.application,
        this.retail,
        this.resell,
        this.image,
        this.url,
        this.draw,
        this.day,
        this.datetime,
      });

  String display_date(String category)
  {
    switch(category)
    {
      case "date":
        return this.datetime.day.toString()+"."+this.datetime.month.toString()+"."+this.datetime.year.toString();
        break;
      case "year":
        return this.datetime.year.toString();
        break;
      case "month":
        return this.datetime.month.toString();
        break;
      case "day":
        return this.datetime.day.toString();
        break;
      case "time":
       String minute = this.datetime.minute.toString();
       String hour = this.datetime.hour.toString();

        if(hour.length < 2)
        {
          minute += "0";
        }

        return hour + ":" + minute;
        break;


    }

  }
}

class Size{

  String size;
  String lowestAsk = 'nd';
  String highestBid = 'nd';
  String lastSale = 'nd';

  Size({this.size, this.lowestAsk = 'nd', this.highestBid = 'nd', this.lastSale = 'nd'});


}
