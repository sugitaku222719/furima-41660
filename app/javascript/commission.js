function commission (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const commissionVal = Math.floor(itemPrice.value * 0.1);
    const profitVal = Math.floor(itemPrice.value - commissionVal);
    const addTaxPrice  = document.getElementById("add-tax-price");
    const profit  = document.getElementById("profit");
    addTaxPrice.innerHTML = `${commissionVal}`;
    profit.innerHTML = `${profitVal}`;
    
  });
};

window.addEventListener('turbo:load', commission);
window.addEventListener("turbo:render", commission);