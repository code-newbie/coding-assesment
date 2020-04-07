fun main() {
    val nomor1 = "(613)-995-0253"
    val nomor2 = "+1 (613)-995-0253"
    val nomor3 = "1 613-995-0253"
    val nomor4 = "613-995-0253"
    val nomor5 = "613.995.0253"
    println(checkPhoneNumber(nomor1))
    println(checkPhoneNumber(nomor2))
    println(checkPhoneNumber(nomor3))
    println(checkPhoneNumber(nomor4))
    println(checkPhoneNumber(nomor5))
}

fun checkPhoneNumber(nomor : String): String {
    var firstComp : String
    var secondComp : String
    var thirdComp : String
    val resultNumber : String
    if (nomor.length === 14) {
       val valid = nomor.substring(0,1)
       val valid2 = nomor.substring(4,5)
        if (valid.equals("(") && valid2.equals(")") ){
            firstComp = nomor.substring(1,4)
            secondComp = nomor.substring(6,9)
            thirdComp = nomor.substring(10,14)
            resultNumber = firstComp+secondComp+thirdComp
            return resultNumber
        } else if (valid !== "("){
            firstComp = nomor.substring(2,5)
            secondComp = nomor.substring(6,9)
            thirdComp = nomor.substring(10,14)
            resultNumber = firstComp+secondComp+thirdComp
            return resultNumber
        }else{
            println("nomor tidak valid")
            return "0"
        }
    } else if (nomor.length === 17){
        firstComp = nomor.substring(4,7)
        secondComp =nomor.substring(9,12)
        thirdComp = nomor.substring(13, 17)
        resultNumber = firstComp+secondComp+thirdComp
        return resultNumber;
    } else if (nomor.length === 12) {
        firstComp = nomor.substring(0,3)
        secondComp = nomor.substring(4,7)
        thirdComp = nomor.substring(8,12)
        resultNumber = firstComp+secondComp+thirdComp
        return resultNumber;
    } else {
        println("error")
        return "0"
    }
}
