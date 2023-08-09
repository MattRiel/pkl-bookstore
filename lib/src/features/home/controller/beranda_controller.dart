import '../../../api/buku_api.dart';
import '../../../api/penulis_api.dart';
import '../model/beranda_model.dart';

class BerandaController {
  final BerandaModel model = BerandaModel();

  Future<void> loadData() async {
    List<Map<String, dynamic>> userData = await fetchUserData();
    List<Map<String, dynamic>> latestBookData = await fetchLatestBooks();
    List<Map<String, dynamic>> generalBookData = await fetchGeneralBooks();
    List<Map<String, dynamic>> journalBookData = await fetchJournals();
    List<Map<String, dynamic>> proceedingBookData = await fetchProceedings();

    model.userDataList = userData;
    model.latestBooks = latestBookData;
    model.generalBooks = generalBookData;
    model.journals = journalBookData;
    model.proceedings = proceedingBookData;
  }
}
