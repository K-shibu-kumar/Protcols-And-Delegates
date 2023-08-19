
protocol AdvancedLifeSupport {
    func performCPR()
}



class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened")
    }
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct ParaMedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The Paramedic does some chest compressions, 30 per seconds")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The Doctor  does some chest compressions, 30 per seconds")
    }
    func useStethoscope() {
        print("Listening to heartbeat")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Doing some crazy stuff")
    }
    func useElectricDrill() {
        print("Whirr....")
    }
}

let emilio = EmergencyCallHandler()
let dixon = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
