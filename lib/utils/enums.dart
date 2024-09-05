enum BlocStateStatus { initial, loading, success, failed, updated }

enum ToastStateStatus {
  success("This is a success message"),
  failed('This is a failed message'),
  updated('This is an updated message');

  final String message;
  const ToastStateStatus(this.message);
}
