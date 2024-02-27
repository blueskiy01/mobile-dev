class University {
 // Private Attributes
 String _name;
 String _city;
 int? _ranking; // Nullable as it's optional

 // Constructor
 University(this._name, this._city, [this._ranking]);

 // Public Getters
 String get name => _name;
 
 String get city => _city;

 int? get ranking => _ranking;

}