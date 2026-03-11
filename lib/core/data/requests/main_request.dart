class MainRequest {
  int? pageNumber;
  int? pageSize;
  bool? isOpened;
  int? threadId;

  MainRequest({
    this.pageNumber,
    this.pageSize,
    this.isOpened,
    this.threadId,
  });
}