paypal.Buttons({

    createOrder:function(data,actions){
        return actions.order.create({
            purchase_units:[{
                amount:{
                    value:'0.1'
                }
            }]
        });
    },

    onApprove:function(data, actions){
        return actions.order.capture().then(function(details) {
            console.log(details)
            window.location.replace("views/confirmation.php")
        })
    }

}).render('#paypal-pay-btn');