abstract class HomePresenter{
	Stream<String> get searchStream;
	
	Stream<String> get searchErrorStream;
	
	Stream<String> get navigateToStream;
	
	Stream<bool> get isLoadingStream;
	
	void dispose();
	
	Future<void> search();
}