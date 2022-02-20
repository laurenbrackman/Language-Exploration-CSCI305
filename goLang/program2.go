//Program 2

package main;

import (
	"fmt";
	"io/ioutil";
	"os";)

func check(e error) {
    if e != nil {
	panic(e);
    }
}

func isNum(char string) bool {
    var num = [...]string {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };
    for i := 0; i < 10; i++ {
	if char == num[i] {
	    return true;
	}
    }
    return false;
}
 
func parseOut(in string) string {
	if len(in) == 0 {
		return "";
	}else if isNum(string(in[0])){
		return parseOut(in[1:]);
	}else{
		return string(in[0]) + parseOut(in[1:]);
	}
}

func writeFile(file string, text string) {
	err := ioutil.WriteFile(file, []byte(text), 0644);
	check(err)
	return
}

func readFile(file string) string {
	contents, err := ioutil.ReadFile(file);
	check(err);
	return string(contents);
}

func main() {
    var input string = os.Args[1];
    var contents string = readFile(input);
    var parsed string = parseOut(contents);

    fmt.Print("Output file (.out): ");
    var output string;
    fmt.Scanln(&output);
    writeFile(output, parsed);
    fmt.Println("Task Completed!");
}
