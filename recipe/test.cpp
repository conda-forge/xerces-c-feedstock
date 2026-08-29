#include <cstring>

#include <xercesc/dom/DOM.hpp>
#include <xercesc/framework/MemBufInputSource.hpp>
#include <xercesc/parsers/XercesDOMParser.hpp>
#include <xercesc/util/PlatformUtils.hpp>
#include <xercesc/util/XMLString.hpp>

int main() {
  using namespace xercesc;

  XMLPlatformUtils::Initialize();
  bool valid = false;
  {
    constexpr char xml[] = "<root/>";
    MemBufInputSource source(
        reinterpret_cast<const XMLByte *>(xml), std::strlen(xml), "inline",
        false);
    XercesDOMParser parser;
    parser.parse(source);

    DOMElement *root = parser.getDocument()->getDocumentElement();
    char *name = XMLString::transcode(root->getTagName());
    valid = std::strcmp(name, "root") == 0;
    XMLString::release(&name);
  }
  XMLPlatformUtils::Terminate();

  return valid ? 0 : 1;
}
