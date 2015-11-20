app.controller('authCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data) {
    //initially set those objects to null to avoid undefined error
    $scope.login = {};
    $scope.signup = {};
    $scope.doLogin = function (customer) {
        /*Data.post('candidate_login/login', {
            customer: customer
        }).then(function (results) {
            Data.toast(results);
            if (results.status == "success") {
                $location.path('dashboard');
            }
        });*/

        xml = new XMLHttpRequest();

        xml.onreadystatechange = function () {
            if(xml.readyState == 4 && xml.status == 200)
            {
                res = JSON.parse(xml.responseText);

                if(res.status == 'success')
                {
                    $location.path("/dashboard");
                }
                else
                {
                    Data.toast(res);
                }
            }
        }

        xml.open("POST","http://localhost/unigig/the_head/candidate_login/login",false);
        xml.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xml.send("customer="+JSON.stringify(customer));
    };

    $scope.signup = {email:'',password:'',name:'',phone:'',address:''};

    $scope.signUp = function (customer) {
        /*Data.post('candidate_login/signUp', {
            customer: customer
        }).then(function (results) {
            console.log(results);
        });*/

        xml = new XMLHttpRequest();

        xml.onreadystatechange = function () {
            if(xml.readyState == 4 && xml.status == 200)
            {
                res = JSON.parse(xml.responseText);

                if(res.status == 'success')
                {
                    $location.path("/dashboard");
                }
                else
                {
                    Data.toast(res);
                }
            }
        }

        xml.open("POST","http://localhost/unigig/the_head/candidate_login/signUp",false);
        xml.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xml.send("customer="+JSON.stringify(customer));

    };

    $scope.logout = function () {
        Data.get('candidate_login/logout').then(function (results) {
            Data.toast(results);
            $location.path('login');
        });
    }
});