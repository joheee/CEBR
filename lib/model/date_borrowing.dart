class DateBorrowing {
  int borrowedPeople;
  String borrowedDate;
  String borrowedPurpose;
  String borrower;
  String borrowedTime;
  bool isNotified;
  bool isVerified;

  DateBorrowing(
      {this.borrowedDate = '2022-09-24',
      this.borrowedPeople = 0,
      this.borrowedPurpose = 'dummy purpose',
      this.borrower = 'dummy students',
      this.borrowedTime = 'dummy time',
      this.isNotified = false,
      this.isVerified = false});
  
}
