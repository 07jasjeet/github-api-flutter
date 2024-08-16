
class Resource<T> {
  Status status;
  T? data;
  String? message;

  Resource.loading() : status = Status.LOADING;
  Resource.success(this.data) : status = Status.COMPLETED;
  Resource.error(this.message) : status = Status.ERROR;

  bool isLoading() {
    return status == Status.LOADING;
  }

  bool isFailed() {
    return status == Status.ERROR;
  }

  bool isSuccessful() {
    return status == Status.COMPLETED;
  }

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }