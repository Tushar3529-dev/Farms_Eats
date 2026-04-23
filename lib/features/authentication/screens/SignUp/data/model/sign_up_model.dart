class SignupModel {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String role;

  final String businessName;
  final String informalName;
  final String address;
  final String city;
  final String state;
  final int zipCode;

  final String registrationProof;
  final Map<String, List<String>> businessHours;

  final String deviceToken;
  final String type;
  final String socialId;

  SignupModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
    required this.businessName,
    required this.informalName,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.registrationProof,
    required this.businessHours,
    required this.deviceToken,
    required this.type,
    required this.socialId,
  });

  
  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "email": email,
      "phone": "+91${phone}",
      "password": password,
      "role": role,
      "business_name": businessName,
      "informal_name": informalName,
      "address": address,
      "city": city,
      "state": state,
      "zip_code": zipCode,
      "registration_proof": registrationProof,
      "business_hours": businessHours,
      "device_token": deviceToken,
      "type": type,
      "social_id": socialId,
    };
  }
}