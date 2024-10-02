function commission (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const commissionVal = Math.floor(itemPrice.value * 0.1);
    const profitVal = itemPrice.value - commissionVal;
    const addTaxPrice  = document.getElementById("add-tax-price");
    const profit  = document.getElementById("profit");
    addTaxPrice.innerHTML = `${commissionVal}`;
    profit.innerHTML = `${profitVal}`;
    
  });
};

window.addEventListener('turbo:load', commission);