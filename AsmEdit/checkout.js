let cart = loadCart();

/*
	Param: phone string
	Return: true or false
	Do:
		+ check if there is any 'alphabet'
		+ check if its length is 10
 */
function checkPhoneNumber(phone)
{
	//check if it contains alphabet
	let result = phone.match(/[a-zA-Z]/);
	if (result != null)
		return false;
	
	//check if it has correct length
	if (phone.length != 10)
		return false;

	return true;
}

/*
	Check if it has the form: string@string
	Param: email string
	Return: true or false
	Do:
		+ Find @. If found, store its index, if not alert error
		+ Get 2 parts: before and after '@'
		+ Check if any of them is empty
 */
function checkEmail(email)
{
	//find @
	let idx = email.indexOf("@");
	if ( idx == -1 )
		return false;

	//get 2 parts of email
	let before = email.slice(0, idx);
	let after = email.slice(idx+1);

	if (before.length == 0)
		return false;

	if (after.length == 0)
		return false;
	
	return true;
}

function checkName(name)
{
	if (name.length == 0)
		return false;

	return true;
}

/*
	Param: event object
	Return: true or false
	Do:
		- Check if names are empty
		- Check if email has correct form
		- Check if number has correct form
 */
function submitHandler(eventObj)
{
	
	//------------- check first name -------------------
	let firstname = document.querySelector("#first_name").value;
	let check = checkName(firstname);
	if (check == false)
	{
		alert("First name cannot be empty");
		return false;
	}
	
	
	//------------- check last name -------------------
	let lastname = document.querySelector("#last_name").value;
	check = checkName(lastname);
	if (check == false)
	{
		alert("Last name cannot be empty");
		return false;
	}
	

	//------------- check email -------------------
	let email = document.querySelector("#email").value;
	check = checkEmail(email);
	if (check == false)
	{
		alert("Wrong email format. Correct form: something@something");
		return false;
	}
	
	//------------- check phone number -------------------
	let phone = document.querySelector("#phone_number").value;
	check = checkPhoneNumber(phone);
	if (check == false)
	{
		alert("Wrong number format");
		return false;
	}
	
	

	return true;
}

function registerEvent()
{
	let form_elem = document.querySelector("#checkout_form");
	form_elem.addEventListener("submit", submitHandler);

	let total_elem = document.querySelector("#totalPrice");
	total_elem.innerText = String(totalCartCost(cart));
}

function firstRun()
{
	changeNumberOfItemCart(cart.length);
	registerEvent();
}

firstRun();