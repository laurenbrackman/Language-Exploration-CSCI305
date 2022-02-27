//Program 2

package main;

import (
	"fmt";
	"io/ioutil";
	"os";
	"regexp";
	)

func check(e error) {
    if e != nil {
	panic(e);
    }
}

func openAndReadFile(file string) string {
	contents, err := ioutil.ReadFile(file);
	check(err);
	return string(contents);
}

func parseOutNumbers(code string) string {
        if len(code) == 0 {
                return "";
        }else if regexp.MustCompile(`^[0-9]`).MatchString(string(code[0])){
		return string(code[0])  + parseOutNumbers(code[1:]);
        }else{
		return " " + parseOutNumbers(code[1:]);
	}
}

func writeFile(file string, text string) {
        err := ioutil.WriteFile(file, []byte(text), 0644);
        check(err)
        return
}

func main() {
    var input string = os.Args[1];
    var secretCode string = openAndReadFile(input);
    var parsedCode string = parseOutNumbers(secretCode);
    var outputFile string;
    fmt.Println("Output file name including .out: ");
    fmt.Scanln(&outputFile);
    writeFile(outputFile, parsedCode);
}
