<h1 align="center">
  <img alt="ezDelivery_logo" src="https://github.com/DinukaGayashan/ezDelivery/blob/master/Mobile%20Application/ezdelivery/assets/images/ezdelivery.png?raw=true" width=200/><br/>
  <b>ezDelivery</b><br>
  <sup><i>Software solution for package delivery systems</i></sup>
</h1>

## Overview
ezDelivery is a software solution proposed to overcome issues with the traditional package delivery systems with functionalities such as package delivery tracking, location sharing, and managing available times. The system is designed to work independently from the delivery service providers and thus will support any of the method they are to be used.

## Features
There are two main levels of the application user, delivery people and customers. Delivery people cannot register through the application because they must get authorized. They can get registered through the administration and then the application can be used through that account. With the mobile application, customers can create accounts with their credentials such as name, email, contact number, address, and GPS location.

Customers can generate a key and they can share their account just with that key. Also, if they want, they also can revoke it to disable the access to their account. If customer is unable to collect the delivery at certain times, an outage time period can be set. That way the delivery people are able to see the time period that customer is not available. This is useful as they can focus on their work rather than worrying about the delivery and calls. Customers can see the package delivery stages as delivered and delivery pending. Also, they can contact delivery persons of pending deliveries through phone. Customers can also change their credentials including contact number and delivery location. 

Delivery people can add packages to deliver with tracking number, name and customer key which is provided by the user. They are able to see packages that are yet to be delivered and they can see customer details and customer outage times, make phone calls, get customer GPS location, confirm deliveries. Completed delivery list is also available.

## Technologies
### Frontend
[Flutter](https://flutter.dev/) framework with Dart language is used to develop the mobile application. Some additional packages are used to provide some features such as Firebase connection (firebase_core, firebase_auth, cloud_firestore, cloud_functions), GPS location (geolocaotor), time duration selection (duration_picker), link to external applications (url_launcher) etc. External services such as phone caller, Google maps are used to provide functionality outside the mobile application.

### Backend
[Firebase](https://firebase.google.com/) is used as a BaaS (Backend as a Service), and it provides all the backend services required for the mobile application.

- Authentication - Firebase authentication system with email and password is being used and it provides backend services, easy-to-use SDKs, and ready-made UI libraries to authenticate users.

- Database - Cloud Firestore is chosen as the database solution. It is a flexible, scalable database for mobile, web, and server development. The database is structured in a way that two user level functionalities can perform independently.

- Cloud Functions - Cloud functions are used to implement required backend functionality. It is a serverless framework that lets you automatically run backend code in response to events triggered by Firebase features and HTTPS requests. Most of the core features are implemented on cloud functions such as checking user level, generating unique secret key, checking customer validity, and linking a delivery with the corresponding customer and delivery person.

