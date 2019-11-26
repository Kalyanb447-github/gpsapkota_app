
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class rechargeapi { 

 
 final musurl='http://192.168.0.107/woker/public';
 // final musurl='http://192.168.0.100/woker/public';

//  final musurl='192.168.2.9/muspay';
  // final musurl='muspay.in';
   final shareLink='https://play.google.com/store/apps/details?id=com.muspay.mus1';

   final currentVersion='1.0.22';
  
final mycode='tyuiom06rtouUyttert';



 removeSpace(String value){
  var newValue= value.replaceAll(new RegExp(r"\s\b|\b\s"), "");
   return newValue;
 }

removeSpecial(String value){
  var newValue=value.replaceAll(new RegExp(r'[^\w\s]+'),'');
   return newValue;
 }



 // get Benner list 
  Future<List>getBannerList()async{
try{
  final response= await http.post("$musurl/api/getBannerList",body:{
        'requestId': mycode,
 });
  return json.decode(response.body);
}catch(e){
 print(e);
}
 }




 // get Benner list 
  Future<List>getMostSearchedList()async{
  final response= await http.post("$musurl/api/getMostSearchedList",body:{
        'requestId': mycode,
 });
  return json.decode(response.body);
 }


// get Location  list 
  Future<List>getlocation(String mytext)async{
  final response= await http.post("$musurl/api/getLocation",body:{
        'requestId': mycode,
        'search': mytext,
 });
  return json.decode(response.body);
 }


// =================== get service list details ===============

Future<List>getServicelist(String serviceParentId)async{

 final response = await http.post("$musurl/api/getServiceList",body:{
   "parentId":serviceParentId
 });

   return json.decode(response.body);
}

//==================== service list codes ends here ==========



Future<Map> browsePlan(String area_code,String operator_id,String plan_type, String systemRef)async{
 final response= await http.post("http://$musurl/public/api/MyMusSabrowsePlan",body:{
       'area_code' :area_code,
       'operator_id' :operator_id,
       'plan_type' :plan_type,
        'mycode': mycode,
 });
  return json.decode(response.body);
 }


 Future<String>getAuthCode(String musId)async{
   final response= await http.post("http://$musurl/public/api/MyMusSagetAuthCode",body:{
       'id':musId,
 });


var mydata= json.decode(response.body.toString());
var combineData='$mydata sanju1235';
return mydata;
 }



Future<String>getRazCode(String musId)async{
   final response= await http.post("http://$musurl/public/api/MyMusSagetRazCode",body:{
       'id' :musId,
 });

var mydata= json.decode(response.body.toString());
var combineData='$mydata sanju1235';
return mydata;
 }


// 

sendSms(String mobile_no,String message)async{
  
final response= await http.post("http://$musurl/public/api/MyMusSasendMsg",body:{
       'mobile_no' :mobile_no,
       'message' :message,
        
 });
return json.decode(response.body);
}


 sendEmail(String customer_name, String customer_id,String subject,String message,String email)async{
 final response= await http.post("http://$musurl/public/api/MyMusSasendEmail",body:{
       'from': '$email',
        'to': 'care@mustechnologies.com',
        'subject' : '$subject',
        'user_id' : '$customer_id',
        'body':'$message'
 });
 return json.decode(response.body);
 
}


Future<Map>getRechargeStatus(String order_no)async{
  print(order_no);
final response= await http.post("http://$musurl/public/api/MyMusSagetRechargeStatus",body:{
       'order_no':order_no,
        'mycode': mycode,
 });
return json.decode(response.body);
}


Future<Map>customerRegistration(String customerName,String customerPincode,String customerMobile)async{

  // print('customerName  $customerName ');
  // print('customerPincode  $customerPincode ');
  // print('customerMobile  $customerMobile ');



final response= await http.post("http://$musurl/public/api/MyMusSacustomerRegistration",body:{
       'customerName' :customerName,
       'customerPincode' :customerPincode,
       'customerMobile' :customerMobile,
        'mycode': mycode,
 });
 var  mydata=json.decode(response.body);
 return mydata;
}



Future<Map>registeredCustomerDetail(String customerMobile)async{
final response= await http.post("http://$musurl/public/api/MyMusSaregisteredCustomerDetail",body:{
       'customerMobile' :customerMobile,
        'mycode': mycode,
 });
return json.decode(response.body);
}


Future<List>listOfBeneficery(String customerMobile)async{
final response= await http.post("http://$musurl/public/api/MyMusSalistOfBeneficery",body:{
       'customerMobile' :customerMobile,
        'mycode': mycode,
 });
var data = json.decode(response.body);
return data['data']['beneficiaryList'];
}

Future<Map>validateBeneficery(String customerMobile,String accountNo,String ifscCode )async{
final response= await http.post("http://$musurl/public/api/MyMusSavalidateBeneficery",body:{
       'customerMobile' :customerMobile,
       'accountNo' :accountNo,
       'ifscCode' :ifscCode,
        'mycode': mycode,
 });
return json.decode(response.body);

}



Future<Map>addBeneficery(String customerMobile,String benecificeryName,String benefeciryMobile,String accountNo,String ifscCode,String bankName )async{

final response= await http.post("http://$musurl/public/api/MyMusSaaddBeneficery",body:{
       'customerMobile' :customerMobile,
       'benecificeryName' :benecificeryName,
       'benefeciryMobile' :benefeciryMobile,
       'accountNo' :accountNo,
       'ifscCode' :ifscCode,
        'mycode': mycode,
        'bankName': bankName,
 });
return json.decode(response.body);

}


verifyBeneficery(String customerMobile,String otp,String beneficeryId)async{
final response= await http.post("http://$musurl/public/api/MyMusSaverifyBeneficery",body:{
       'customerMobile' :customerMobile,
       'otp' :otp,
       'beneficeryId' :beneficeryId,
        'mycode': mycode,
 });
return json.decode(response.body);

}



// 


deleteBeneficery(String customerMobile,String beneficeryId)async{
final response= await http.post("http://$musurl/public/api/MyMusSadeleteBeneficery",body:{
       'customerMobile' :customerMobile,
       'beneficeryId' :beneficeryId,
        'mycode': mycode,
 });
return json.decode(response.body);

}

deleteBeneficeryOtp(String customerMobile,String beneficeryId,String otp)async{
final response= await http.post("http://$musurl/public/api/MyMusSadeleteBeneficeryOtp",body:{
       'customerMobile' :customerMobile,
       'beneficeryId' :beneficeryId,
       'otp' :otp,
        'mycode': mycode,
 });
return json.decode(response.body);

}

kycSendOtp(String kycMobile,)async{
final response= await http.post("http://$musurl/public/api/MyMusSakycOtp",body:{
       'mobile' :kycMobile,
       'mycode': mycode,
 });
//  print(response.body);
 return json.decode(response.body);

}


kycRegister(String kycMobile,String customerName,String shopName ,String address,String pincode,String state,
String email,String panNo,String dob,String adharNo, String otp)async{

final response= await http.post("http://$musurl/public/api/MyMusSaregisterKyc",body:{
       'mobile' :kycMobile,
       'customerName' :customerName,
       'shopName' :shopName,
       'address' :address,
       'pinCode' :pincode,
       'state' :state,
       'email' :email,
       'pan' :panNo,
       'dob' :dob,
       'aadhar' :adharNo,
       'otp' :otp,
       'mycode': mycode,
 });
//  print(response.body);
 return json.decode(response.body);

}



Future<Map>buyVoucher(String amount,String operator_id, String systemRef,String user_id, String senderName, String receiverName,String receiverEmail,String senderMobile,String receiverMobile,
String giftMessage,mycode1)async{

// print("amount $amount");
// print("operator_id $operator_id");
// print("user_id $user_id");
// print("systemRef $systemRef");
// print("senderName $senderName");
// print("receiverName $receiverName");
// print("receiverEmail $receiverEmail");
// print("senderMobile $senderMobile");
// print("receiverMobile $receiverMobile");
// print("receiverMobile $receiverMobile");


final response= await http.post("http://$musurl/public/api/MybuyVoucher",body:{
       'amount' :amount,
       'operator_id' :operator_id,
       'user_id' :user_id,
       'systemRef' :systemRef,
       'senderName' :senderName,
       'receiverName' :receiverName,
       'receiverEmail' :receiverEmail,
       'senderMobile' :senderMobile,
       'receiverMobile' :receiverMobile,
       'giftMessage' :giftMessage,
       'mycode': mycode1,
 });
//  print(response.body);
 return json.decode(response.body);
 

}



Future<Map>cardBalance(String cardNumber,String pinNumber)async{
final response= await http.post("http://$musurl/public/api/MycardBalance",body:{
       'cardNumber' :cardNumber,
       'pinNumber' :pinNumber,
 });
return json.decode(response.body);

}



// --------------------------------------------My server api cal ------------------------------------------

Future<Map> login(String email,String password)async{
final response= await http.post("http://$musurl/public/api/MyMusSalogin",body:{
       'email' : email,
        'password': password,
        'mycode': mycode,
        
 });
 var mydata=json.decode(response.body);
return mydata;

}

Future <Map> createUser(String name,String mobile,String email,String password,String refferal)async{
 final response= await http.post("http://$musurl/public/api/MyMusSastoreUser",body:{
       'name' : name,
        'mobile': mobile,
        'email' : email,
        'password': password,
        'role' : 'client',
        'refferal_code':refferal,
        'mycode': mycode,
 });
 return json.decode(response.body);
 
}

Future <Map> getuserdetails(String user_id)async{
 final response= await http.post("http://$musurl/public/api/MyMusSauser",body:{
       'id' :user_id,
 });
 return json.decode(response.body);

}

Future<Map>updateUserRech(String user_id,String pincode,String rech_id)async{
  // updateUserRech
  final response= await http.post("http://$musurl/public/api/MyMusSaupdateUserRech",body:{
       'user_id' :user_id,
       'pincode':pincode,
       'rech_id':rech_id,
       'mycode': mycode,
 });
 return json.decode(response.body);
}

Future <Map> getUserByMobile(String mobile)async{
 final response= await http.post("http://$musurl/public/api/MyMusSagetUserByMobile",body:{
       'mobile' :mobile,
 });
 return json.decode(response.body);
 
}




Future <Map> checkForgetDetail(String mobile)async{
 final response= await http.post("http://$musurl/public/api/MyMusSacheckForgetDetail",body:{
       'mobile' :mobile,
 });
 return json.decode(response.body);
 
}



Future <Map> sendSmsForPass(String uid)async{
 final response= await http.post("http://$musurl/public/api/MyMusSasendSmsForPass",body:{
       'uid' :uid,
 });
 return json.decode(response.body);
 
}





Future <Map> getUserByEmail(String email)async{
 final response= await http.post("http://$musurl/public/api/MyMusSagetUserByEmail",body:{
       'email' :email,
       'mycode':mycode
 });
 return json.decode(response.body);
}


Future <String> walletBalance(String userid)async{
 final response= await http.post("http://$musurl/public/api/MyMusSagetBalance",body:{
       'user_id' :userid,
       'mycode':mycode
 });
 var mydata=json.decode(response.body);

 return mydata;
}

Future <String> refBalance(String userid)async{
 final response= await http.post("http://$musurl/public/api/MyMusSarefBalance",body:{
       'user_id' :userid,
 });
 var mydata=json.decode(response.body);
 return mydata;
}



// Future <Map> createOrder(
// String orderDate,
// String totalAmount,
// String orderDescription,
// String getwayOrderid,
// String walletOrderid,
// String deductionType,
// String rechOrderId,
// String operatorOrderId,
// String oderStatus,
// String musOrderId,
// String user_id,
// String orderType,
// String operator_name,
// String mobileNo,
// String operatorId,
// String rechAmount,
// String fee,
// String stateCode,
// String stateName,

// )async{


//   final response = await http.post('http://$musurl/public/api/MyMusSacreateOrder',body:{
//      "orderDate":orderDate,
//      "rechAmount":rechAmount,
//       "fee":fee,
//      "totalAmount":totalAmount,
//      "orderDescription":orderDescription,
//      "getwayOrderid":getwayOrderid,
//      "walletOrderid":walletOrderid,
//      "walletAmountDeduct":'NA',
//      "gatewayAmountDeduct":"NA",
//      "deductionType":deductionType,
//      "rechOrderId":rechOrderId,
//      "operatorOrderId":operatorOrderId,
//      "oderStatus":oderStatus,
//      "musOrderId":musOrderId,
//      "user_id":user_id,
//      "orderType":orderType,
//       "operator_name":operator_name,
//       "mobileNo":mobileNo,
//       "operatorId":operatorId,
//       "stateCode":stateCode,
//       "stateName":stateName,
      
//   });
//     var myorder=json.decode(response.body);
//   return myorder;   
  
// }



 
Future <Map> updateOrder(String orderid,String operatorId,String status,String wallet_id)async{

final response = await http.post('http://$musurl/public/api/MyMusSaupdateOrders',body:{
     "operatorOrderId":operatorId,
     "oderStatus":status,
     "orderId":orderid,
     "wallet_id":wallet_id,
  });
    var myorder=json.decode(response.body);
 return myorder;
}




Future <Map> checkpost(
String date,
String amount_type,
String amount,
String fee,
String totalAmount,
String wallet_desc,
String musWalletId,
String gatewayId,
String user_id,
String orderType,
String mycode1,
String myroute,
String operator_name,
String rechargeMobileNo,
String operatorId,
String stateCode,
String stateName,
String trackMobile,
String moneyReceiverId,
String moneyPayableId,
String transferCustomerMobile,
String transferAmount,
String beneficeryId,
String rechargeOrderType,
String rechargeDescription,
String checkOpt,
  String optValue1,
  String optValue2,
  String otpValue3
 )async{ 


print('http://$musurl/public/api/mycheckpost');
final response = await http.post('http://$musurl/public/api/MyMusSacheckpost',body:{
     "date":date,
     "amount":amount,
     "amount_type":amount_type,
     "fee":fee,
     "totalAmount":totalAmount,
     "wallet_desc":wallet_desc,
     "musWalletId":musWalletId,
     "gatewayId":gatewayId,
     "user_id":user_id,
     "orderType":orderType,
     'mycode': mycode1,
     'myroute': myroute,
     'operator_name': operator_name,
     'rechargeMobileNo': rechargeMobileNo,
     'operatorId': operatorId,
     'stateCode': stateCode,
     'stateName': stateName,
     'trackMobile': trackMobile,
     'moneyReceiverId': moneyReceiverId,
     'moneyPayableId': moneyPayableId,
     'transferCustomerMobile': transferCustomerMobile,
     'transferAmount': transferAmount,
     'beneficeryId': beneficeryId,
     'rechargeOrderType': rechargeOrderType,
     'rechargeDescription': rechargeDescription,
     'checkOpt':checkOpt,
     'optValue1':optValue1,
     'optValue2':optValue2,
     'optValue3':otpValue3,
  });
  return json.decode(response.body.toString());
   
}
// --------------------------------------- wallet api-----------------------------


Future<Map>checkPerdayLimitAddMoney(String date,String user_id,String balance)async{

  // print('date  $date');
  // print('user_id  $user_id');
  // print('balance  $balance');

final response = await http.post('http://$musurl/public/api/MyMusSacheckPerDayAddMoneyLimit',body:{
     "date":date,
     "user_id":user_id,
     "balance":balance,
  });
//  var mydata= json.decode(response.body.toString());
  return json.decode(response.body.toString());
  //  print(mydata);

}


Future<Map>checkPerDaySendToBankLimit(String date,String user_id,String balance)async{

  

final response = await http.post('http://$musurl/public/api/MyMusSacheckPerDaySendToBankLimit',body:{
     "date":date,
     "user_id":user_id,
     "balance":balance,
  });
//  var mydata= json.decode(response.body.toString());
  return json.decode(response.body.toString());
  //  print(mydata);

}




Future<Map>checkPerDayWalletToWalletLimit(String date,String user_id,String balance)async{

  // print('date  $date');
  // print('user_id  $user_id');
  // print('balance  $balance');

final response = await http.post('http://$musurl/public/api/MyMusSacheckPerDayWalletToWalletLimit',body:{
     "date":date,
     "user_id":user_id,
     "balance":balance,
  });
//  var mydata= json.decode(response.body.toString());
  return json.decode(response.body.toString());
  //  print(mydata);

}





Future <Map> updateMoneyPay(String walletId,String rechOrderId,String transacId,String error_code,)async{
  print(rechOrderId);
  final response = await http.post('http://$musurl/public/api/MyMusSaupdateMoneyPay',body:{
    
     "walletid":walletId,
     "orderId":rechOrderId,
     "trasacId":transacId,
     "error_code":error_code
  });
   var mydata=json.decode(response.body);
  return mydata; 
  
}


Future<List> getPassbookDetail(String user_id)async{
  final response =await http.post("http://$musurl/public/api/MyMusSagetPassbook",body:{
    "user_id":user_id
  });
  List mydata=json.decode(response.body);
  return mydata;
}





Future<List>getRecentRecharge(String recharge_type,String user_id)async{
   final response =await http.post("http://$musurl/public/api/MyMusSagetRecharge",body:{
    "user_id":user_id,
    "recharge_type":recharge_type
  });
  List mydata=json.decode(response.body);
  return mydata;
}



Future<List>getAddMoneyDetail(String user_id)async{
   final response =await http.post("http://$musurl/public/api/MyMusSaaddMoneyDetail",body:{
    "user_id":user_id,
   
  });
  List mydata=json.decode(response.body);
  return mydata;
}


Future<List>getLessMoneyDetail(String user_id)async{
   final response =await http.post("http://$musurl/public/api/MyMusSalessMoneyDetail",body:{
    "user_id":user_id,
   
  });
  List mydata=json.decode(response.body);
  return mydata;
}


Future<List> getOrderDetails(String user_id)async{
  final response =await http.post("http://$musurl/public/api/MyMusSagetOrder",body:{
    "user_id":user_id
  });
  List mydata=json.decode(response.body);
  return mydata;
}


Future<Map> createBeneficery(String user_id,String benName,String benMobile,String benAccount,String benIfsc,String benId)async{
  final response =await http.post("http://$musurl/public/api/MyMusSaaddBeneficery",body:{
    "user_id":user_id,
    "beneficery_name":benName,
    "beneficery_mobileNo":benMobile,
    "beneficery_accountNo":benAccount,
    "beneficery_ifscCode":benIfsc,
    "benId":benId,
  });
  return json.decode(response.body);
}


Future<Map> updateBeneficery(String user_id,String benId)async{
  final response =await http.post("http://$musurl/public/api/MyMusSaupdateBeneficery",body:{
    "user_id":user_id,
    "benId":benId,
  });
  return json.decode(response.body);
  
}



Future<Map> updateProfile(String user_id,String name,String mobile,String password)async{
  final response =await http.post("http://$musurl/public/api/MyMusSaupdateProfile",body:{
    "user_id":user_id,
    "name":name,
    "mobile":mobile,
    "password":password
  });
  return json.decode(response.body);
  
}

Future<Map> updateProfilePersonal(String user_id, String city,String district,String state,String zip,String dob,String anivasary,String pan,String adhar)async{
  final response =await http.post("http://$musurl/public/api/MyMusSaupdateProfilePersonal",body:{
    "user_id":user_id,
    "city":city,
    "district":district,
    "state":state,
    "zip":zip,
    "pan_no":pan,
    "adhar_no":adhar,
    "anivesary":anivasary,
    "dob":dob,
    
  });
  return json.decode(response.body);
  
}

Future<Map> updateProfileKyc(String user_id, String city,String district,String state,String zip,String dob,String kyc,String pan,String adhar)async{
  final response =await http.post("http://$musurl/public/api/MyMusSaupdateProfileKyc",body:{
    "user_id":user_id,
    "city":city,
    "district":district,
    "state":state,
    "zip":zip,
    "pan_no":pan,
    "adhar_no":adhar,
    "kyc":kyc,
    "dob":dob,
    
  });
  return json.decode(response.body);
  
}





checkVersion()async{
// String apiUrl="http://api.rechapi.com/moneyTransfer/deleteBeneficiaryVerifiy.php?format=json&token=${this.apikey}&customerMobile=$customerMobile&beneficiaryId=$beneficeryId&otp=$otp&demo=1";
String apiUrl="http://$musurl/public/api/MyMusSacheckVersion";
http.Response response =await http.get(apiUrl);
return json.decode(response.body);

}





Future<Map>getFees(String type)async{
  final response =await http.post("http://$musurl/public/api/MyMusSagetFees",body:{
    "type":type,
  });
  return json.decode(response.body);
}



Future<String>getFeesForClient(String amount)async{
  // print('amount $amount');

  final response =await http.post("http://$musurl/public/api/MyMusSagetFeesForClient",body:{
    "amount":amount,
  });
  return json.decode(response.body);
}


Future<Map>getFeesForVender(String amount,String type)async{
  
  final response =await http.post("http://$musurl/public/api/MyMusSagetFeesForVender",body:{
    "amount":amount,
    "type":type,
  });
  return json.decode(response.body);
}

  Future<int>getDailyAmountVender(String user_id,String date)async{
  final response =await http.post("http://$musurl/public/api/MyMusSavenderDailyBalance",body:{
    "user_id":user_id,
    "date":date
  });
  return json.decode(response.body);
}



Future<Map> getRefferalCode(String user_id)async{
  final response =await http.post("http://$musurl/public/api/MyMusSagetRefferalCode",body:{
    "user_id":user_id
  });
 return json.decode(response.body);
  
}

Future<List> getVoucher()async{
  final response =await http.post("http://$musurl/public/api/MyMusSavoucherList");
  List mydata=json.decode(response.body);
  return mydata;
}
 


 Future<Map> callBackRequest(String user_id,String mobile)async{
  final response =await http.post("http://$musurl/public/api/MyMusSacallBack",body:{
    "user_id":user_id,
    "mobile":mobile
  });
 return json.decode(response.body);
  
}




// ============================== get operator details=====================
Future<List> getStates()async{
  final response =await http.get("http://$musurl/public/api/getStates");
  List mydata=json.decode(response.body);
  return mydata;
}

Future<List> getPostpaid()async{
  final response =await http.get("http://$musurl/public/api/getPostpaid");
  List mydata=json.decode(response.body);
  return mydata;
}


Future<List> getPrepaid()async{
  
  final response =await http.get("http://$musurl/public/api/getPrepaid");
  // List mydata=json.decode(response.body);
  // print(mydata);

  return json.decode(response.body);
}



Future<List> getDatacard()async{
  
  final response =await http.get("http://$musurl/public/api/getDatacard");
  // List mydata=json.decode(response.body);
  // print(mydata);

  return json.decode(response.body);
}


Future<List> getElectricityBoard(String state_code)async{
  final response =await http.get("http://$musurl/public/api/getElectricity/$state_code");
  List mydata=json.decode(response.body);
  return mydata;
}

Future<List> getWaterBoard()async{
  final response =await http.get("http://$musurl/public/api/getWater");
  List mydata=json.decode(response.body);
  return mydata;
}

Future<List> getGas()async{
  final response =await http.get("http://$musurl/public/api/getGas");
  List mydata=json.decode(response.body);
  return mydata;
}




Future<List> getDth()async{
  final response =await http.get("http://$musurl/public/api/getDth");
  List mydata=json.decode(response.body);
  return mydata;
}


Future<List> getLandline()async{
  final response =await http.get("http://$musurl/public/api/getLandline");
  List mydata=json.decode(response.body);
  return mydata;
}

Future<List> getInsurance()async{
  final response =await http.get("http://$musurl/public/api/getInsurance");
  List mydata=json.decode(response.body);
  return mydata;
}



Future<List> getMetro()async{
  final response =await http.get("http://$musurl/public/api/getMetro");
  List mydata=json.decode(response.body);
  return mydata;
}



Future<Map>checkKyc(String user_id)async{
   final response =await http.post("http://$musurl/public/api/checkKyc",body:{
    "user_id":user_id,
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);
}

//================================ Operator ends here =====================


Future<Map>eStatementRequest(String uid)async{
  print('hello world');
  final response =await http.post("http://$musurl/public/api/estatement",body:{
    "user_id":uid,
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);
}


// ============================== Block ticket=====================



Future<Null>getCity(String key)async{
  final response =await http.post("http://$musurl/public/api/getStation",body:{
    "key":'testingkeys'
  });
 return json.decode(response.body);
}


Future<List>getBus(String sourceCity,String destiCity,String doj)async{
  final response =await http.post("http://$musurl/public/api/getAvailableBuses",body:{
    "sourceCity":sourceCity,
    "destiCity":destiCity,
    "doj":doj
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);
}


Future<Map>busLayoutLower(String sourceCity,String destiCity,DateTime doj, String inventoryType,String routeScheduleId)async{
  final response =await http.post("http://$musurl/public/api/busLayoutLower",body:{
    "sourceCity":sourceCity,
    "destiCity":destiCity,
    "doj":doj.toString(),
    "inventoryType":inventoryType,
    "routeScheduleId":routeScheduleId
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);
}

Future<Map>busLayoutUpper(String sourceCity,String destiCity,DateTime doj, String inventoryType,String routeScheduleId)async{
  final response =await http.post("http://$musurl/public/api/busLayoutUpper",body:{
    "sourceCity":sourceCity,
    "destiCity":destiCity,
    "doj":doj.toString(),
    "inventoryType":inventoryType,
    "routeScheduleId":routeScheduleId
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);
}






Future<Map>blockTicket(
  String sourceCity,
  String destinationCity,
  String inventoryType,
  String routeScheduleId,
  DateTime doj,
  Map boardingDetail,
  Map droppingDetails,
  List totalPassengerDetails,
  String customerName,
  String customerLastName,
  String customerEmail,
  String customerPhone,
  String emergencyPhNumber,
  String customerAddress

)async{

final response =await http.post("http://$musurl/public/api/blockTicket",body:{
    "sourceCity":"$sourceCity",
    "destinationCity":"$destinationCity",
    "inventoryType":"$inventoryType",
    "routeScheduleId":"$routeScheduleId",
    "doj":doj.toString(),
    "boardingDetail":json.encode(boardingDetail),
    "droppingDetails":json.encode(droppingDetails),
    "totalPassengerDetails":json.encode(totalPassengerDetails),
    "customerName":"$customerName",
    "customerLastName":"$customerLastName",
    "customerEmail":"$customerEmail",
    "customerPhone":"$customerPhone",
    "emergencyPhNumber":"$emergencyPhNumber",
    "customerAddress":"$customerAddress",

  });
  // var data=json.decode(response.body);
  // print(data);
return json.decode(response.body);


}



Future <Map> checkpostB(
String date,
String amount_type,
String amount,
String fee,
String totalAmount,
String wallet_desc,
String musWalletId,
String gatewayId,
String user_id,
String orderType,
String mycode1,
String myroute,
String busBookingKey,
String busBookingFare,
String busBookingTax,
String busBookingTotalFare,
String busBookingSourceCity,
String busBookingDestiCity,
String busBookingDoj,
String busNoSeat,
String busOperatorName
 )async{ 

print("this is key $busBookingKey");

final response = await http.post('http://$musurl/public/api/checkpostB',body:{
     "date":date,
     "amount":amount,
     "amount_type":amount_type,
     "fee":fee,
     "totalAmount":totalAmount,
     "wallet_desc":wallet_desc,
     "musWalletId":musWalletId,
     "gatewayId":gatewayId,
     "user_id":user_id,
     "orderType":orderType,
     'mycode': mycode1,
     'myroute': myroute,
     'busBookingKey': busBookingKey,
     'busBookingFare': busBookingFare,
     'busBookingTax': busBookingTax,
     'busBookingTotalFare': busBookingTotalFare,
     'busBookingSourceCity': busBookingSourceCity,
     'busBookingDestiCity': busBookingDestiCity,
     'busBookingDoj': busBookingDoj,
     'busNoSeat': busNoSeat,
     'busOperatorName':busOperatorName,
  });
  return json.decode(response.body.toString());
   
}


Future <Map> checkpostBusG(
String date,
String amount_type,
String amount,
String fee,
String totalAmount,
String wallet_desc,
String musWalletId,
String gatewayId,
String user_id,
String orderType,
String mycode1,
String myroute,
String busBookingKey,
String busBookingFare,
String busBookingTax,
String busBookingTotalFare,
String busBookingSourceCity,
String busBookingDestiCity,
String busBookingDoj,
String busNoSeat,
String busOperatorName
 )async{ 

print("this is key $busBookingKey");

final response = await http.post('http://$musurl/public/api/checkpostBusG',body:{
     "date":date,
     "amount":amount,
     "amount_type":amount_type,
     "fee":fee,
     "totalAmount":totalAmount,
     "wallet_desc":wallet_desc,
     "musWalletId":musWalletId,
     "gatewayId":gatewayId,
     "user_id":user_id,
     "orderType":orderType,
     'mycode': mycode1,
     'myroute': myroute,
     'busBookingKey': busBookingKey,
     'busBookingFare': busBookingFare,
     'busBookingTax': busBookingTax,
     'busBookingTotalFare': busBookingTotalFare,
     'busBookingSourceCity': busBookingSourceCity,
     'busBookingDestiCity': busBookingDestiCity,
     'busBookingDoj': busBookingDoj,
     'busNoSeat': busNoSeat,
     'busOperatorName':busOperatorName,
  });
  return json.decode(response.body.toString());
   
}











// ============================ Block ticket ends here ================


// Future<String> apiRequest(String url, Map jsonMap) async {
//   HttpClient httpClient = new HttpClient();
//   HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
//   request.headers.set('content-type', 'application/json');
//   request.add(utf8.encode(json.encode(jsonMap)));
//   HttpClientResponse response = await request.close();
//   // todo - you should check the response.statusCode
//   String reply = await response.transform(utf8.decoder).join();
//   httpClient.close();
//   return reply;
// }



// ====================== Support page ====================

Future<Map>supportMaster(String uid)async{
  
// print(uid);

  final response =await http.post("http://$musurl/public/api/supportMaster",body:{
    "user_id":uid,
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);
}


Future<List>supportChild(String support_id)async{
  
// print(uid);

  final response =await http.post("http://$musurl/public/api/supportChild",body:{
    "support_id":support_id,
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);
}


Future<Map>createSupportChild(
  String user_id,
  String support_id,
  String msg,
)async{


  final response =await http.post("http://$musurl/public/api/createSupportChild",body:{
    "support_id":support_id,
    "user_id":user_id,
    "message":msg,
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);

}



Future<Map>createSupport(
  String user_id,
  String subject,
  String msg,
)async{


  final response =await http.post("http://$musurl/public/api/createSupport",body:{
    "subject":subject,
    "user_id":user_id,
    "message":msg,
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);

}



Future<List>recentBus(
  String user_id,
)async{

  final response =await http.post("http://$musurl/public/api/recentBus",body:{
    "user_id":user_id,
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);

}


Future<Map>busCancelConfirm(
  String busId,
)async{

  final response =await http.post("http://$musurl/public/api/cancelTicketConfirmation",body:{
    "bus_id":busId,
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);

}



Future<Map>busCancelFinal(
  String busId,
)async{

  final response =await http.post("http://$musurl/public/api/cancelTicket",body:{
    "bus_id":busId,
  });
return json.decode(response.body);
// var data= json.decode(response.body);
// print(data);

}



}







