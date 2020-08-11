import React, { useState } from 'react'

import { PayTypes } from './types'
import { NoPayType } from './components/no-pay';
import { CheckPayType } from './components/check-pay';
import { CreditCardPayType } from './components/credit-card-pay';
import { PurchaseOrderPayType } from './components/purchase-order-pay/purchase-order-pay-type';

export function PayTypeSelector() {

  const [payType, setPayType] = useState<PayTypes>(PayTypes.NO_PAY)

  const onPayTypeSelected = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setPayType(e.target.value as PayTypes);
  }

  return (
    <div className="field">
      <label htmlFor="order_pay">Pay type</label>
      <select onChange={onPayTypeSelected} id="order_pay" name="order[pay_type]">
        <option value={PayTypes.NO_PAY}>Select a payment method</option>
        <option value={PayTypes.CHECK_PAY}>Check</option>
        <option value={PayTypes.CREDIT_CARD_PAY}>Credit card</option>
        <option value={PayTypes.PURCHASE_ORDER_PAY}>Purchase order</option>
      </select>
      { payType === PayTypes.NO_PAY &&
        <NoPayType />
      }
      { payType === PayTypes.CHECK_PAY &&
        <CheckPayType />
      }
      { payType === PayTypes.CREDIT_CARD_PAY &&
        <CreditCardPayType />
      }
      { payType === PayTypes.PURCHASE_ORDER_PAY &&
        <PurchaseOrderPayType />
      }
    </div>
  );
}