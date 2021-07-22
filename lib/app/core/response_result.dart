class ResponseResult {
  ResponseResult._();

  factory ResponseResult.success(Object data) = SuccessResult;

  factory ResponseResult.error(ResponseException exception) = ErrorResult;

  factory ResponseResult.complete() = CompleteResult;
}

class SuccessResult extends ResponseResult {
  SuccessResult(this.data) : super._();
  final Object data;
}

class ErrorResult extends ResponseResult {
  ErrorResult(this.exception) : super._();
  final ResponseException exception;
}

class CompleteResult extends ResponseResult {
  CompleteResult() : super._();
}

class ResponseException with Exception {

  ResponseException({required this.message});

  String? message;
}
