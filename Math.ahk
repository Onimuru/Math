;============ Auto-Execute ====================================================;
;======================================================  Setting  ==============;

#Requires AutoHotkey v2.0-a134-d3d43350

;======================================================  Include  ==============;

#Include %A_LineFile%\..\..\Core.ahk

;===============  Class  =======================================================;

Class Math {

	__New(params*) {
        throw (Error("This class must not be constructed.", -1))
	}

	;-------------- Property ------------------------------------------------------;  ;* ** Constants: https://numerics.mathdotnet.com/Constants.html. **

	;* Description:
		;* Euler's exponential constant.
	static E {
		Get {
			return (2.718281828459045)  ;? ≈ Exp(1)
		}
	}

	;* Description:
		;* The smallest signficant differentiation between two floating point values. Useful as a tolerance when testing if two single precision real numbers approximate each other.
	;* Note:
		;* The smallest 32-bit integer greater than zero is `1/(2**32 - 1)`.
	static Epsilon {
		Get {
			epsilon := 1.0

			while (epsilon + 1 > 1) {
				epsilon /= 2
			}

			this.DefineProp("Epsilon", {Value: epsilon *= 2})  ;* Only initialize this value as needed.
			return (epsilon)
		}
	}

	;* Description:
		;* Calculate the base-2 logarithm of a number.
	static Log2[number := ""] {
		Get {
			if (number == "") {
				return (0.693147180559945)
			}

			if (number > 0) {
				return (Ln(number)/0.693147180559945)
			}

			throw (Error("NaN.", -1, Format("Math.Log2({}) is out of bounds.", number)))
		}
	}

	;* Description:
		;* The base-2 logarithm of E.
	static Log2E {
		Get {
			return (1.442695040888963)
		}
	}

	;* Description:
		;* Calculate the base-10 logarithm of a number.
	static Log10[number := ""] {
		Get {
			if (number == "") {
				return (2.302585092994046)
			}

			if (number > 0) {
				return (Log(number))
			}

			throw (Error("NaN.", -1, Format("Math.Log10({}) is out of bounds.", number)))
		}
	}

	;* Description:
		;* The base-10 logarithm of E.
	static Log10E {
		Get {
			return (0.434294481903252)
		}
	}

	static Pi {
		Get {
			return (3.141592653589793)  ;? ≈ ACos(-1)
		}
	}

	;* Description:
		;* The ratio of a circle's circumference to its diameter (τ).
	static Tau {
		Get {
			return (6.283185307179587)
		}
	}

	;* Math.Clamp(number, lower, upper)
	;* Description:
		;* Limit a number to a upper and lower value.
	static Clamp(number, lower, upper) {
		return (((number := (number < lower) ? (lower) : (number)) > upper) ? (upper) : (number))
	}

	;* Math.Min(numbers*)
	;* Description:
		;* Calculate the numerically smallest of two or more numbers.
	static Min(numbers*) {
		return (Min(numbers*))
	}

	;* Math.Max(numbers*)
	;* Description:
		;* Calculate the numerically largest of two or more numbers.
	static Max(numbers*) {
		return (Max(numbers*))
	}
}