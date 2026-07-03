def maths():
    hw = input("What is the Maths homework?")
    final = ""
    if hw:
        final = f"{text_bold('Maths')}: {hw}\n"
    return final


def phy():
    hw = input("What is the Physics homework?")
    final = ""
    if hw:
        final = f"{text_bold('Physics')}: {hw}\n"
    return final


def chem():
    hw = input("What is the Chemistry homework?")
    final = ""
    if hw:
        final = f"{text_bold('Chemistry')}: {hw}\n"
    return final


def bio():
    hw = input("What is the bio homework?")
    final = ""
    if hw:
        final = f"{text_bold('Biology')}: {hw}\n"
    return final


def sst():
    hw = input("What is the SST homework?")
    final = ""
    if hw:
        final = f"{text_bold('SST')}: {hw}\n"
    return final


def hindi():
    hw = input("What is the Hindi homework?")
    final = ""
    if hw:
        final = f"{text_bold('Hindi')}: {hw}\n"
    return final


def eng():
    hw = input("What is the English homework?")
    final = ""
    if hw:
        final = f"{text_bold('English')}: {hw}\n"
    return final


def additional():
    additional = input("Tell any additional details needed: ")
    return additional


def text_bold(Str):
    return f"*{Str}*"


def print_header():
    date = datetime.datetime.now().strftime("%d-%m-%Y")
    results.append(f"*Homework*\n\n{functions.text_bold(date)}\n")
