document.addEventListener("DOMContentLoaded", function () {
    const radios = document.querySelectorAll(".subject-radio");

    const infoBox = document.createElement("div");
    infoBox.className = "mt-3 alert alert-info";
    infoBox.textContent = "Vybrané předměty: 0 / 1";
    document.querySelector("form").insertBefore(infoBox, document.querySelector("form button"));

    function getSelectedCount() {
        return [...radios].filter(r => r.checked).length;
    }

    function updateState() {
        const selectedCount = getSelectedCount();
        infoBox.textContent = `Vybrané předměty: ${selectedCount} / 1`;

        radios.forEach(radio => {
            if (!radio.checked) {
                radio.disabled = selectedCount >= 1;
            } else {
                radio.disabled = false;
            }
        });
    }

    radios.forEach(r => r.addEventListener("change", updateState));

    // Inicializace stavu
    updateState();
});

