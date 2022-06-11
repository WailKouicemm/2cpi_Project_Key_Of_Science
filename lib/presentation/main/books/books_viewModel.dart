// import 'package:flutter/cupertino.dart';
//
//
//
// class booksViewModel extends ChangeNotifier{
//
//   bool isloading = false;
//   Future<void> downloadFile(String url,List Infos) async {
//     String ModuleTitle=Infos.last;
//     Dio dio = Dio(); // c'est obligatoire d'initialisé
//     isloading=true;
//     notifyListeners();
//     if (await permision(Permission.storage) == true) {
//       try {
//         var directories = await patth.getExternalStorageDirectories(
//             type: patth.StorageDirectory.documents);
//         var path = directories![0].path;
//         var directory = Directory(path + '/BacDocuments');
//         await directory.create(recursive: true);
//         File savefile =
//         File(directory.path + '/' + url.substring(url.indexOf("view&id="))); // this is the path of our file / i put the name of the PDF in the files of the phone is the link
//         await dio.download(
//           url,
//           savefile.path,
//           onReceiveProgress: (rec, total) {
//             percentage = rec / total;
//             print("percentage $percentage");
//             // Queue.update(url, (value) => value=percentage);
//             notifyListeners();
//             if (percentage < 0) { // cad il ya une error
//               ShowToast('حدث خطأ ما');
//               //      state = url + '0';
//               AfterState='0';
//               notifyListeners();
//               throw 'error';
//             }
//           },
//         );
//         if (await savefile.exists()) {
//           // cad le fichier teltecharger
//           //  state = "${url}0";
//           AfterState='0';
//           setNmaeAndPath(url,savefile.path,Infos);
//           fatcDownlods(ModuleTitle);
//         } else {
//           // cad le fichier n'est pas teltecharger
//           ShowToast('حدث خطأ ما');
//           //   state = "${url}1";
//           AfterState='1';
//           isloading = false;
//         }
//       } //try
//
//       catch (e) {
//         print(e);
//         ShowToast('حدث خطأ ما');
//         // state = url + '0';
//         AfterState='0';
//         isloading = false;
//       }
//     }
//     Queue.remove(url);
//     isloading=false;
//     state="${url}0";
//     notifyListeners();
//     if (Queue.isNotEmpty) {
//       downloadFile(Queue.keys.first,Queue.values.first,);
//     };
//     //  Queue.clear();
//   }
//
//
// }