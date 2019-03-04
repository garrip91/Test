<?php 

	// Функция "isCorrect($param)" (для проверки корректности каждой строки согласно условию), в которой параметр "$param" будет использоваться в качестве примера:
  	function isCorrect($param) {
		$stack = [];
		$symbols = array('[' => ']', '{' => '}', '(' => ')');

		foreach(str_split($param) as $s) {
			if(array_key_exists($s, $symbols)) {
				$stack[] = $s;
				continue;
			}  elseif(array_search($s, $symbols) == array_pop($stack)) {
				  continue;
			   }
			return false;
		}
		
		return true;
	} 
	
//	var_dump(assert(isCorrect('') === true));
//	var_dump(assert(isCorrect('()') === true));
//	var_dump(assert(isCorrect('{(})[]') === false));

?>