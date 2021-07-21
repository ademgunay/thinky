class ResponseResult {
  ResponseResult._();

  factory ResponseResult.success(Object data) = SuccessResult;

  factory ResponseResult.error(Exception exception) = ErrorResult;

  factory ResponseResult.complete() = CompleteResult;
}

class SuccessResult extends ResponseResult {
  SuccessResult(this.data) : super._();
  final Object data;
}

class ErrorResult extends ResponseResult {
  ErrorResult(this.exception) : super._();
  final Exception exception;
}

class CompleteResult extends ResponseResult {
  CompleteResult() : super._();
}
