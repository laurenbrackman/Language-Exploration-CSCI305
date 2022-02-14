        PROGRAM SuperSpy
                IMPLICIT  NONE
                INTEGER num, code, first, third, sixth
                WRITE(*,*) 'Hat size?'
                READ*, num     
                code = (first(num)*100)+(third(num)*10)+sixth(num)
                WRITE(*,*) 'Use', code
        END PROGRAM  SuperSpy

        INTEGER FUNCTION first(num)
                IMPLICIT NONE
                INTEGER :: num
                first = num/10**0-10*(num/10**(0+1))
                RETURN
        END FUNCTION first
        
        INTEGER FUNCTION third(num)
                IMPLICIT NONE
                INTEGER :: num
                third = num/10**2-10*(num/10**(2+1))
                RETURN
        END FUNCTION third

        INTEGER FUNCTION sixth(num)
                IMPLICIT NONE
                INTEGER :: num
                sixth= num/10**5-10*(num/10**(5+1))
                RETURN
        END FUNCTION sixth
