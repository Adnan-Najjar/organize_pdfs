# organize_pdfs
A simple script to organize pdfs in multiple folders based on their content, utilizing multi-threading of parallel command.

## Installation

Simply clone the repository and run `make` to install the dependencies and the script :-

```bash
git clone https://github.com/Adnan-Najjar/organize_pdfs
cd organize_pdfs
make
```

## Usage

Use this command while in the directory with the pdfs to categorize:-

```bash
organize-pdfs --root root --report
```

### Output
```
.
├── AI
│   ├── Machine_Learning
│   │   └── machine_learning.pdf
│   └── Neural_Networks
│       └── neural_networks.pdf
├── Database
│   ├── NoSQL
│   │   └── nosql.pdf
│   └── SQL
│       └── sql.pdf
├── Math
│   ├── Calculus
│   │   └── calculus.pdf
│   └── Linear_Algebra
│       └── linear_algebra.pdf
├── Programming
│   ├── C
│   │   └── clang.pdf
│   ├── Java
│   │   └── java.pdf
│   └── Python
│       └── python.pdf
└── Security
    ├── Cryptography
    │   └── cryptography.pdf
    └── Networks_Security
        └── network_security.pdf

17 directories, 11 files
How many files are incorrectly categorized? (0/11) 0

 Analysis Report:
 ----------------
 Programming: 27%
 Math: 18%
 AI: 18%
 Database: 18%
 Security: 18%

Correctness Score: 100%
Are you sure you want to move the files to the corresponding folders? (y/n) y
```

## Options

```
--------------------------------------------------------------------------------
Usage: organize_pdfs --root <folder> [--report]
NOTE: Make sure you are in the directory with the pdfs to categorize.

Options:
  --root <folder>   Specify the root folder where the categorized files will be moved
  --report          Calculate the accuracy of the categorization
--------------------------------------------------------------------------------
```

## Dependencies

- GNU Parallel
- pdftotext (part of poppler-utils)
- tree
