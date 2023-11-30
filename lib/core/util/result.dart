import 'package:equatable/equatable.dart';

enum Status {
  success,
  failed,
}

class Result<T> extends Equatable {
  final Status _status;
  final String? message;
  final T? _data;

  Result._(this._status, this.message, this._data);

  T? get data => _data;

  bool get isSuccess => _status == Status.success;

  bool get isFailed => _status == Status.failed;

  static Result<T> success<T>({required T data, String? message}) {
    return Result<T>._(Status.success, message, data);
  }

  static Result<T> failed<T>({String? message}) {
    return Result<T>._(Status.failed, message, null);
  }

  @override
  String toString() {
    return 'Result(status: $_status, message: $message, data: $_data)';
  }

  @override
  List<Object?> get props => [_status, _data, message];

}
