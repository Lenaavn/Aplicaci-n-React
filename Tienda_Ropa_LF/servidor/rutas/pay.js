import Stripe from "stripe";
const stripe = new Stripe('sk_test_XXXXXXXXXXXXXXXX');

// Función para procesar un pago
export const pay = async (req, res) => {
    const { amount, id } = req.body;
    try {
        const payment = await stripe.paymentIntents.create({
            amount,
            currency: 'COP',
            description: 'Shop Payment',
            payment_method: id,
            confirm: true
        });

        console.log('payment', payment);
        res.json({
            message: 'Payment successful',
            success: true
        });
    } catch (error) {
        console.error('error', error);
        res.json({
            message: 'Payment failed',
            success: false
        });
    }
};
