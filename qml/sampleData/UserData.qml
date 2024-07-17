import QtQuick

// Populate the model with some sample data.
ListModel {
    id: userData

    ListElement {
        birthYear: 1994
        sex: Female
        height: 162
        weight: 50
        mood: 10
        kcal: 1800
        water: 2
        sleepAmount: 8
        sleepQuality: 10
        workoutTime: 2
        stressLevel: 1
        drugs: no
        medicines: no
        suplements: no
    }
}
