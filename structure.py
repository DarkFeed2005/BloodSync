import os

# Define the project structure
structure = {
    "frontend": {
        "public": {},
        "src": {
            "components": {
                "common": ["Navbar.jsx", "Footer.jsx", "Button.jsx", "Card.jsx"],
                "donor": ["DonorDashboard.jsx", "DonorProfile.jsx", "HealthScreening.jsx", "AppointmentBooking.jsx"],
                "hospital": ["HospitalDashboard.jsx", "BloodRequest.jsx", "LiveStock.jsx"],
                "admin": ["AdminDashboard.jsx", "UserManagement.jsx"],
                "auth": ["Login.jsx", "Register.jsx"]
            },
            "pages": ["Home.jsx", "About.jsx", "FindDonors.jsx", "Contact.jsx"],
            "services": ["api.js"],
            "context": ["AuthContext.jsx"],
            "utils": ["helpers.js"],
            "files": ["App.jsx", "index.css"]
        },
        "files": ["package.json", "tailwind.config.js"]
    },
    "backend": {
        "config": ["database.php", "cors.php"],
        "api": {
            "auth": ["login.php", "register.php", "logout.php"],
            "donor": ["profile.php", "screening.php", "appointments.php", "history.php"],
            "hospital": ["requests.php", "stock.php", "matching.php"],
            "admin": ["users.php", "system.php"],
            "notifications": ["send.php"]
        },
        "models": ["User.php", "Donor.php", "Hospital.php", "BloodRequest.php", "Appointment.php"],
        "middleware": ["auth.php"],
        "utils": ["helpers.php"]
    }
}


def create_structure(base_path, structure_dict):
    for key, value in structure_dict.items():
        path = os.path.join(base_path, key)
        os.makedirs(path, exist_ok=True)

        if isinstance(value, dict):
            create_structure(path, value)
        elif isinstance(value, list):
            for file in value:
                file_path = os.path.join(path, file)
                open(file_path, "w").close()
        elif key == "files":
            for file in value:
                file_path = os.path.join(base_path, file)
                open(file_path, "w").close()


if __name__ == "__main__":
    base_dir = os.getcwd()  # current folder (your root)
    create_structure(base_dir, structure)
    print("✅ BloodSync project structure created successfully!")